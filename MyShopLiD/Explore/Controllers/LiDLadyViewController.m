//
//  LiDLadyViewController.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/5/31.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDLadyViewController.h"
#import "LiDManViewCell.h"
#import "LiDManModel.h"
#import "LiDManCell.h"
#import "postObjectInfo.h"

@interface LiDLadyViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
/** 表格视图 */
@property(nonatomic,strong)UITableView *ladyTable;

/** 数据源 */
@property(nonatomic,strong)NSMutableArray *dataArray;

/** 搜索框 */
@property(nonatomic,strong)UISearchBar *searchBar;

/** 当前页数 */
@property(nonatomic,assign)NSInteger currentPage;

/** 类别ID */
@property(nonatomic,assign)NSInteger categoryID;
/** 总页数 */
@property(nonatomic,assign)NSInteger totalPage;

/** httpManager */
@property(nonatomic,strong)AFHTTPSessionManager *httpManager;
@end

NSString * const ladyIdentifier=@"longCell";
NSString * const ladyShort=@"shortCell";


@implementation LiDLadyViewController

#pragma mark -懒加载
-(NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        _dataArray=[NSMutableArray array];
    }
    return _dataArray;
}

-(AFHTTPSessionManager *)httpManager{
    
    if (!_httpManager) {
        _httpManager=[AFHTTPSessionManager manager];
        
    }
    
    return _httpManager;
}

#pragma mark -生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.categoryID=2;
    self.currentPage=1;
    
    [self setupViews];
    [self firstLoad];
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [self.httpManager.operationQueue cancelAllOperations];
}

-(void)firstLoad{
    
    self.categoryID=2;
    self.currentPage=1;
    [self.ladyTable.mj_header beginRefreshing];
}

-(void)setupViews{
    
    //初始化tableView
    self.ladyTable=[[UITableView alloc]init];
    
    [self.ladyTable setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.ladyTable];
    //代理
    [self.ladyTable setDelegate:self];
    [self.ladyTable setDataSource:self];
    [self.ladyTable setRowHeight:UITableViewAutomaticDimension];
    
    
    __weak typeof(self) weakSelf=self;
    [self.ladyTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    
    
    self.ladyTable.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.currentPage=1;
        
        [weakSelf requestData];
    }];
    
    self.ladyTable.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.currentPage++;
        if (weakSelf.currentPage>weakSelf.totalPage) {
            [weakSelf.ladyTable.mj_footer endRefreshingWithNoMoreData];
        }else{
            [weakSelf requestData];
        }
        
    }];
    
    
    /**
     *  注册单元格
     */
    [self.ladyTable registerNib:[UINib nibWithNibName:NSStringFromClass([LiDManViewCell class]) bundle:nil] forCellReuseIdentifier:ladyIdentifier];
    
    [self.ladyTable registerNib:[UINib nibWithNibName:NSStringFromClass([LiDManCell class]) bundle:nil] forCellReuseIdentifier:ladyShort];
    
    //searchBar初始化
    self.searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 0, 40)];
    
    [self.searchBar setDelegate:self];
    [self.searchBar setPlaceholder:@"搜索女装"];
    [self.searchBar setReturnKeyType:UIReturnKeySearch];
    [self.searchBar setBackgroundImage:[UIImage imageNamed:@"searchBackImg"]];
    
    
    
    //UISearchBar去边框方法一:
    [[[[[self.searchBar subviews]objectAtIndex:0] subviews]objectAtIndex:1] setBackgroundColor:[UIColor clearColor]];
    
    [self.ladyTable setTableHeaderView:self.searchBar];
    
}

#pragma mark -数据请求
-(void)requestData{
    
    
    NSString *curPage=[NSString stringWithFormat:@"%ld",(long)self.currentPage];
    __weak typeof(self) weakSelf=self;
    [self.httpManager GET:[NSString stringWithFormat:IManAndLady,(long)self.categoryID,curPage] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        LiDManModel *model=[LiDManModel yy_modelWithJSON:responseObject];
        weakSelf.totalPage=model.totalPage;
        
        if (weakSelf.currentPage==1) {
            [weakSelf.dataArray removeAllObjects];
        }
        
        [weakSelf.dataArray addObjectsFromArray:model.postObjectInfo];
        
        [weakSelf.ladyTable.mj_header endRefreshing];
        [weakSelf.ladyTable.mj_footer endRefreshing];
        [weakSelf.ladyTable reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"亲,我尽力了..."];
        weakSelf.currentPage--;
        [weakSelf.ladyTable.mj_header endRefreshing];
        [weakSelf.ladyTable.mj_footer endRefreshing];
        NSLog(@"%@",error.localizedDescription);
    }];
}

#pragma mark -<UITableViewDelegate>
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    postObjectInfo *model=self.dataArray[indexPath.row];
    
    if (model.productsInfo.count>0) {
        model.cellHeight=450;
        LiDManViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ladyIdentifier forIndexPath:indexPath];
        cell.model=model;
        
        return cell;
    }else{
        model.cellHeight=200;
        LiDManCell *cell=[tableView dequeueReusableCellWithIdentifier:ladyShort forIndexPath:indexPath];
        cell.model=model;
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    postObjectInfo *model=self.dataArray[indexPath.row];
    return model.cellHeight;
}

#pragma mark -<UISearchBarDelegate>
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [self.searchBar setShowsCancelButton:YES];
    
    for (UIView *subView in searchBar.subviews) {
        for (UIButton *cancleBtn in subView.subviews) {
            if ([cancleBtn isKindOfClass:[UIButton class]]) {
                [cancleBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
                [cancleBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
            }
        }
        
    }
    [self.searchBar becomeFirstResponder];
}


-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    [self.searchBar resignFirstResponder];
    [self.searchBar setShowsCancelButton:NO];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.searchBar isFirstResponder]) {
        [self.searchBar resignFirstResponder];
        [self.searchBar setShowsCancelButton:NO];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

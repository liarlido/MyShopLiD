//
//  LiDManViewController.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/5/31.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDManViewController.h"
#import "LiDManViewCell.h"
#import "LiDManModel.h"

@interface LiDManViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
/** 表格视图 */
@property(nonatomic,strong)UITableView *manTable;

/** 数据源 */
@property(nonatomic,strong)NSMutableArray *dataArray;

/** 搜索框 */
@property(nonatomic,strong)UISearchBar *searchBar;

/** 当前页数 */
@property(nonatomic,assign)NSInteger currentPage;

/** 类别ID */
@property(nonatomic,assign)NSInteger categoryID;

/** httpManager */
@property(nonatomic,strong)AFHTTPSessionManager *httpManager;
@end

NSString * const manIdentifier=@"manCell";

@implementation LiDManViewController


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
    self.categoryID=1;
    self.currentPage=1;
    
    [self setupViews];
    [self firstLoad];
    
}

-(void)firstLoad{

    self.categoryID=1;
    self.currentPage=1;
    [self.manTable.mj_header beginRefreshing];
}

-(void)setupViews{

    //初始化tableView
    self.manTable=[[UITableView alloc]init];
    
    [self.manTable setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.manTable];
    //代理
    [self.manTable setDelegate:self];
    [self.manTable setDataSource:self];
//    [self.manTable setRowHeight:350];
    self.manTable.estimatedRowHeight = 400;
    self.manTable.rowHeight = UITableViewAutomaticDimension;
    
    __weak typeof(self) weakSelf=self;
    [self.manTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    
    
    self.manTable.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.currentPage=1;
        [weakSelf requestData];
    }];
    
    self.manTable.mj_footer=[MJRefreshAutoFooter footerWithRefreshingBlock:^{
        weakSelf.currentPage++;
        [weakSelf requestData];
    }];
    
    
    /**
     *  注册单元格
     */
    [self.manTable registerNib:[UINib nibWithNibName:NSStringFromClass([LiDManViewCell class]) bundle:nil] forCellReuseIdentifier:manIdentifier];
    
    
    
    //searchBar初始化
    self.searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 0, 40)];
    
    [self.searchBar setDelegate:self];
    [self.searchBar setPlaceholder:@"搜索男装"];
    [self.searchBar setReturnKeyType:UIReturnKeySearch];
    [self.searchBar setBackgroundImage:[UIImage imageNamed:@"searchBackImg"]];
    
    
    
    //UISearchBar去边框方法一:
    [[[[[self.searchBar subviews]objectAtIndex:0] subviews]objectAtIndex:1] setBackgroundColor:[UIColor clearColor]];
    
    [self.manTable setTableHeaderView:self.searchBar];
    
}
#pragma mark -数据请求
-(void)requestData{

    NSString *curPage=[NSString stringWithFormat:@"%ld",(long)self.currentPage];
    __weak typeof(self) weakSelf=self;
    [self.httpManager GET:[NSString stringWithFormat:IManAndLady,(long)self.categoryID,curPage] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        LiDManModel *model=[LiDManModel yy_modelWithJSON:responseObject];
        [self.dataArray addObjectsFromArray:model.postObjectInfo];
        
        [weakSelf.manTable.mj_header endRefreshing];
        [weakSelf.manTable.mj_footer endRefreshing];
        [self.manTable reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"亲,我尽力了..."];
        weakSelf.currentPage--;
        [weakSelf.manTable.mj_header endRefreshing];
        [weakSelf.manTable.mj_footer endRefreshing];
    }];
}



#pragma mark -<UITableViewDelegate>
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    LiDManViewCell *cell=[tableView dequeueReusableCellWithIdentifier:manIdentifier forIndexPath:indexPath];
    cell.model=self.dataArray[indexPath.row];
    
    
    return cell;
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

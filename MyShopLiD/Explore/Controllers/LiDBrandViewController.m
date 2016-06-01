//
//  LiDBrandViewController.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/1.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDBrandViewController.h"
#import "LiDBrandViewCell.h"
#import "LiDBrandModel.h"

@interface LiDBrandViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

/** 表格视图 */
@property(nonatomic,strong)UITableView *brandTable;

/** 数据源 */
@property(nonatomic,strong)NSMutableArray *dataArray;

/** 搜索框 */
@property(nonatomic,strong)UISearchBar *searchBar;

/** 当前页数 */
@property(nonatomic,assign)NSInteger currentPage;

/** httpManager */
@property(nonatomic,strong)AFHTTPSessionManager *httpManager;


@end

NSString * const brandIdentifier=@"brandCell";

@implementation LiDBrandViewController

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
    self.currentPage=1;
    
    [self setupViews];
    [self firstLoad];
}
#pragma mark -第一次加载
-(void)firstLoad{

    self.currentPage=1;
    [self requestBrandWithDirectPage:self.currentPage];
    [self.brandTable.mj_header beginRefreshing];
    
}

#pragma mark -页面初始化
-(void)setupViews{
    
    //初始化tableView
    self.brandTable=[[UITableView alloc]init];
    
    [self.brandTable setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.brandTable];
    //代理
    [self.brandTable setDelegate:self];
    [self.brandTable setDataSource:self];
    [self.brandTable setRowHeight:180];
    
    __weak typeof(self) weakSelf=self;
    [self.brandTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    /**
     *  添加上拉加载和下拉刷新
     */
    self.brandTable.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf.brandTable.mj_footer setHidden:YES];
        [weakSelf.dataArray removeAllObjects];
        weakSelf.currentPage=1;
        [weakSelf requestBrandWithDirectPage:self.currentPage];
    }];
    
    self.brandTable.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf.brandTable.mj_header setHidden:YES];
        weakSelf.currentPage++;
        [weakSelf requestBrandWithDirectPage:weakSelf.currentPage];
    }];
    
    /**
     *  注册单元格
     */
    [self.brandTable registerNib:[UINib nibWithNibName:NSStringFromClass([LiDBrandViewCell class]) bundle:nil] forCellReuseIdentifier:brandIdentifier];
    
    //searchBar初始化
    self.searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 0, 40)];
    
    [self.searchBar setDelegate:self];
    [self.searchBar setPlaceholder:@"搜索品牌"];
    [self.searchBar setReturnKeyType:UIReturnKeySearch];
    [self.searchBar setBackgroundImage:[UIImage imageNamed:@"searchBackImg"]];
    
    
    
    //UISearchBar去边框方法一:
    [[[[[self.searchBar subviews]objectAtIndex:0] subviews]objectAtIndex:1] setBackgroundColor:[UIColor clearColor]];
    //UISearchBar去边框方法二:
//    for (UIView *view in self.searchBar.subviews) {
//        for (id subView in view.subviews) {
//            if ([subView isKindOfClass:[UITextField class]]) {
//                [subView setBackgroundColor:[UIColor clearColor]];
//            }
//        }
//    }
    
    [self.brandTable setTableHeaderView:self.searchBar];
}


#pragma mark -<UITableViewDataSource>
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    LiDBrandViewCell *cell=[tableView dequeueReusableCellWithIdentifier:brandIdentifier forIndexPath:indexPath];
    
    if (self.dataArray.count>0) {
        
        cell.model=self.dataArray[indexPath.row];
    }
    
    return cell;
}

#pragma mark -请求数据
-(void)requestBrandWithDirectPage:(NSInteger) page{
    NSString *curPage=[NSString stringWithFormat:@"%ld",self.currentPage];
    __weak typeof(self) weakSelf=self;
    [self.httpManager GET:[NSString stringWithFormat:IBrand,curPage] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if([weakSelf.brandTable.mj_header isRefreshing]){
        
            [weakSelf.brandTable.mj_header endRefreshing];
        }
        if([weakSelf.brandTable.mj_footer isRefreshing]){
            
            [weakSelf.brandTable.mj_footer endRefreshing];
        }
        
        
        //解析成Model
        NSArray *modelsArray=[NSArray yy_modelArrayWithClass:[LiDBrandModel class] json:responseObject];
        [self.dataArray addObjectsFromArray:modelsArray];
        [self.brandTable reloadData];
        
        [weakSelf.brandTable.mj_header setHidden:NO];
        [weakSelf.brandTable.mj_footer setHidden:NO];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        self.currentPage--;
        [SVProgressHUD showErrorWithStatus:@"加载失败,请重试"];
    }];

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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

//
//  LiDHotViewController.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/5/31.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDHotViewController.h"
#import "LiDHotCollectionViewCell.h"
#import "MechantInfo.h"
#import "LiDHotProductModel.h"

@interface LiDHotViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
/** collectionView */
@property(nonatomic,strong)UICollectionView *collectionView;
/** 数据源 */
@property(nonatomic,strong)NSMutableArray *dataArray;
/** httpManager */
@property(nonatomic,strong)AFHTTPSessionManager *httpManager;
/** 当前页 */
@property(nonatomic,assign)NSInteger currentPage;

@end

NSString *const cellIdentifier=@"collectionCell";

@implementation LiDHotViewController

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
    
    [self setupTopLine];
    
    [self requestData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)setupTopLine{

    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    [flowLayout setHeaderReferenceSize:CGSizeMake(self.view.frame.size.width, 40)];
    [flowLayout setSectionInset:UIEdgeInsetsMake(0, 10, 5, 10)];
    [flowLayout setMinimumLineSpacing:5];
    [flowLayout setMinimumInteritemSpacing:5];
    
    
    self.collectionView=[[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.collectionView setDelegate:self];
    [self.collectionView setDataSource:self];
    [self.view addSubview:self.collectionView];
    [self.collectionView setBackgroundColor:[UIColor grayColor]];
    
    
    
    /**
     *  注册头视图
     */
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    /**
     *  注册单元格
     */
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([LiDHotCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:cellIdentifier];
    
    /**
     *  上拉加载与下拉刷新
     */
    self.collectionView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.collectionView.mj_header setHidden:NO];
        [self requestData];
    }];
    
}

#pragma mark -<UICollectionViewDelegate>
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    
    return self.dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    LiDHotCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell setBackgroundColor:RGBCOLOR(arc4random()%256, arc4random()%256, arc4random()%256)];
    
    cell.model=self.dataArray[indexPath.row];
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"hotTop"]];
        [imageView setFrame:CGRectMake(5, 0, (self.collectionView.frame.size.width-10), 30)];
        UICollectionReusableView *header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        [header addSubview:imageView];
        return header;
    }
    return nil;
}


#pragma mark -cell尺寸
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    
    CGFloat width=(self.view.frame.size.width/2.0)-15;
    return CGSizeMake(width, 365);
}



#pragma mark -请求数据
-(void)requestData{

    NSString *curPage=[NSString stringWithFormat:@"%ld",(long)self.currentPage];
    __weak typeof(self) weakSelf=self;
    [self.httpManager GET:[NSString stringWithFormat:IHot,curPage] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [weakSelf.collectionView.mj_header endRefreshing];

        /** 解析数据 */
        NSArray *modelArray=[NSArray yy_modelArrayWithClass:[LiDHotProductModel class] json:responseObject[@"hotproductlist"]];
        
        [self.dataArray addObjectsFromArray:modelArray];
        [self.collectionView reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [weakSelf.collectionView.mj_header endRefreshing];
        NSLog(@"%@",error.localizedDescription);
    }];
}

@end

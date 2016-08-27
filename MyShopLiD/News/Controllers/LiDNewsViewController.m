//
//  LiDNewsViewController.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/5/30.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDNewsViewController.h"
#import "NewGoodsViewController.h"
#import <MDCSwipeToChoose/MDCSwipeToChoose.h>
#import "NewProductInfo.h"
#import "NewGoodsViewController.h"

@interface LiDNewsViewController ()<MDCSwipeToChooseDelegate>

@property(nonatomic,strong)AFHTTPSessionManager *httpManager;
/** 数据源 */
@property(nonatomic,strong)NSMutableArray *dataArray;
/** 当前第几页 */
@property(nonatomic,assign)NSInteger currentPage;

@property(nonatomic,copy)NSString *shopId;
@end

@implementation LiDNewsViewController

#pragma mark -懒加载
-(AFHTTPSessionManager *)httpManager{

    if (!_httpManager) {
        
        _httpManager=[AFHTTPSessionManager manager];
    }
    return _httpManager;
}

-(NSMutableArray *)dataArray{

    if (!_dataArray) {
        _dataArray=[NSMutableArray array];
    }
    
    return _dataArray;
}


- (void)viewDidLoad {
    self.currentPage=0;
    [super viewDidLoad];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(likeItem) name:@"likeAction" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(disLikeItem) name:@"disLikeAction" object:nil];
    
}
-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    [self requestData];
}

#pragma mark -滑动方向对应操作
- (BOOL)view:(UIView *)view shouldBeChosenWithDirection:(MDCSwipeDirection)direction {
    self.currentPage++;
    if (self.currentPage==self.dataArray.count) {
        self.currentPage--;
        [SVProgressHUD showErrorWithStatus:@"没有更多了"];
        return NO;
    }
    if (direction == MDCSwipeDirectionLeft) {
        [self disLikeItem];
        return YES;
    } else if(direction==MDCSwipeDirectionRight){
        [self likeItem];
        return YES;
    }else{
    
        [UIView animateWithDuration:0.16 animations:^{
            view.transform = CGAffineTransformIdentity;
            view.center = [view superview].center;
        }];
        self.currentPage--;
        return NO;
    }
}




#pragma mark -收藏商品
-(void)likeItem{

    NewProductInfo *item=self.dataArray[self.currentPage];
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"productid"]=[NSString stringWithFormat:@"%ld",(long)item.product.proid];
    params[@"shopid"]=self.shopId;
    
    [self.httpManager POST:INewCollect parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD showSuccessWithStatus:@"收藏成功"];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}

-(void)disLikeItem{

    NewProductInfo *item=self.dataArray[self.currentPage];
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"productid"]=[NSString stringWithFormat:@"%ld",(long)item.product.proid];
    params[@"shopid"]=self.shopId;
    
    [self.httpManager POST:INewCancle parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD showSuccessWithStatus:@"取消成功"];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}

#pragma mark -加载数据
-(void)requestData{
    
    __weak typeof(self) weakSelf=self;
    [self.httpManager GET:ITenderProducts parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        weakSelf.shopId=responseObject[@"shopid"];
        
        NSArray *products=[NSArray yy_modelArrayWithClass:[NewProductInfo class] json:responseObject[@"productsInfo"]];
        
        [self.dataArray addObjectsFromArray:products];
        [weakSelf loadSwipeChoose];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.localizedDescription);
    }];
    
}

#pragma mark -加载滑动选择视图控制器
-(void)loadSwipeChoose{

    MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
    options.likedText = @"Like";
    options.likedColor = [UIColor whiteColor];
    options.nopeText = @"Pass";
    options.nopeColor=[UIColor whiteColor];
    options.delegate=self;
    
    
    for (int i=0; i<self.dataArray.count; i++) {
        MDCSwipeToChooseView *view= [[MDCSwipeToChooseView alloc] initWithFrame:CGRectMake(0, 64, SCWidth, SCHeight-108) options:options];
        NewGoodsViewController *productVC=[[NewGoodsViewController alloc]init];
        [productVC.view setFrame:CGRectMake(0, 0, SCWidth, SCHeight-108)];
        productVC.model=self.dataArray[i];
        [view insertSubview:productVC.view atIndex:0];
        [self addChildViewController:productVC];
        [self.view addSubview:view];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)dealloc{

    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

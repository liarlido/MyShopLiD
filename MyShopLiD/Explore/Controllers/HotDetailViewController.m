//
//  HotDetailViewController.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/6.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "HotDetailViewController.h"
#import "HotDetailHeaderVC.h"
#import "HotDetailModel.h"

@interface HotDetailViewController ()<UIScrollViewDelegate>
/** 全局滚动视图 */
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewHeight;
@property (weak, nonatomic) IBOutlet UIView *topView;

/** httpManager */
@property(nonatomic,strong)AFHTTPSessionManager *httpManager;
/** 模型 */
@property(nonatomic,strong)HotDetailModel *model;
/** 顶部滚动视图 */
@property (weak, nonatomic) IBOutlet UIScrollView *topScrollView;
/** 分页管理 */
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;
/** 类型Label */
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
/** 商家头像 */
@property (weak, nonatomic) IBOutlet UIImageView *mechantImageView;
/** 商家名称 */
@property (weak, nonatomic) IBOutlet UILabel *mechantNameLabel;
/** 商家描述 */
@property (weak, nonatomic) IBOutlet UILabel *mechantDescLabel;
/** 详情视图 */
@property (weak, nonatomic) IBOutlet UIView *detailView;
/** 产品尺寸 */
@property (weak, nonatomic) IBOutlet UIView *sizeView;
/** 试穿效果 */
@property (weak, nonatomic) IBOutlet UIView *wearingView;
/** 平面效果 */
@property (weak, nonatomic) IBOutlet UIView *flatView;
/** 设计效果 */
@property (weak, nonatomic) IBOutlet UIView *designView;
/** 照片宽高比 */
@property(nonatomic,assign)CGFloat imgHeight;

@property (weak, nonatomic) IBOutlet UILabel *proNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *likeLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sizeHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *wearingHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *flatHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *designHeight;

@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;

@property (weak, nonatomic) IBOutlet UILabel *wearingLabel;

@property (weak, nonatomic) IBOutlet UILabel *flatLabel;
@property (weak, nonatomic) IBOutlet UILabel *designLabel;

@end

@implementation HotDetailViewController


#pragma mark -懒加载
-(AFHTTPSessionManager *)httpManager{
    
    if (!_httpManager) {
        _httpManager=[AFHTTPSessionManager manager];
    }
    
    return _httpManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigation];
    self.imgHeight=SCWidth/(2/3.0f);
    [self requestData];
    
    
}

#pragma mark -页面布局

-(void)setupViews{
    
    //最开始四个子视图均隐藏
    self.sizeView.hidden=YES;
    self.wearingView.hidden=YES;
    self.flatView.hidden=YES;
    self.designView.hidden=YES;
    self.detailView.hidden=YES;
    
    
    [self setupTopScrollView];
    [self setImages];
    [self setupDetailViews];
    
}


-(void)setupTopScrollView{
    if (self.model.introimages.count>0) {
        for (int i=0; i<self.model.introimages.count; i++) {
            //从URL中取出图片宽高
            NSArray *array=[[[[self.model.introimages[i] stringByDeletingPathExtension] componentsSeparatedByString:@"_"] lastObject] componentsSeparatedByString:@"x"];
            //计算图片高度
            self.imgHeight=SCWidth/([array[0] floatValue]/[array[1] floatValue]);
            UIImageView *imgV=[[UIImageView alloc]init];
            [imgV sd_setImageWithURL:[NSURL URLWithString:self.model.introimages[i]] placeholderImage:[UIImage imageNamed:@"imgLoadBG"]];
            [imgV setFrame:CGRectMake(i*SCWidth, 0, SCWidth, self.imgHeight)];
//            [self.topScrollView addSubview:imgV];
            [self.topScrollView insertSubview:imgV atIndex:0];
        }
        
        //顶部滚动视图相关设置
        self.topViewHeight.constant=self.imgHeight;
        
        [self.topScrollView setContentSize:CGSizeMake(self.model.introimages.count*SCWidth, 0)];
        [self.topScrollView setPagingEnabled:YES];
        [self.topScrollView setShowsVerticalScrollIndicator:NO];
    
        [self.topView bringSubviewToFront:self.typeLabel];
        [self.topView bringSubviewToFront:self.pageController];
        
        [self.topScrollView setShowsVerticalScrollIndicator:NO];
        [self.topScrollView setShowsHorizontalScrollIndicator:NO];
        
        self.topScrollView.delegate=self;
        
        
        //分页控制器视图
        [self.topView bringSubviewToFront:self.pageController];
        self.pageController.numberOfPages=self.model.introimages.count;
        self.pageController.currentPage=0;
    }
}
-(void)setupDetailViews{
    //商品详情整个的高度
    self.detailView.height=self.sizeHeight.constant+self.wearingHeight.constant+self.flatHeight.constant+self.designHeight.constant;
    
    //scroll内容
    CGFloat scrollContentHeight=self.detailView.height+self.topViewHeight.constant+108;
    
    self.scrollView.contentSize=CGSizeMake(SCWidth, scrollContentHeight);
    
    
    self.typeLabel.text=[[self.model.product.categoryInfo firstObject] category].name;
    self.proNameLabel.text=self.model.product.name;
    self.priceLabel.text=[NSString stringWithFormat:@"￥%ld",self.model.product.lowest_price];
    self.likeLabel.text=[NSString stringWithFormat:@"%ld%%用户喜欢这个产品",(long)self.model.product.likeRatio];
    
    [self.mechantImageView sd_setImageWithURL:[NSURL URLWithString:self.model.merchantinfo.merchant.imgGroup.avatar] placeholderImage:[UIImage imageNamed:@"biaoti_1~iphone"]];
    self.mechantNameLabel.text=self.model.merchantinfo.merchant.name;
    self.mechantDescLabel.text=[NSString stringWithFormat:@"商品数量:%ld,商品销量:%ld",self.model.merchantinfo.merchant.sales_amount,self.model.merchantinfo.merchant.sales_volume];
    self.detailView.hidden=NO;
    
}

#pragma mark -设置每个分类中图片的位置
-(void)setImages{

    if (self.model.sizeimages.count>0) {
        //尺寸中照片摆放
        CGFloat sizeY=CGRectGetMaxY(self.sizeLabel.frame);
        CGFloat MAXY=sizeY;
        for (int i=0; i<self.model.sizeimages.count; i++) {
            //从URL中取出图片宽高
            NSArray *array=[[[[self.model.sizeimages[i] stringByDeletingPathExtension] componentsSeparatedByString:@"_"] lastObject] componentsSeparatedByString:@"x"];
            //计算图片高度
            self.imgHeight=SCWidth/([array[0] floatValue]/[array[1] floatValue]);
            
            UIImageView *imageView=[[UIImageView alloc]init];
            [imageView sd_setImageWithURL:[NSURL URLWithString:self.model.sizeimages[i]] placeholderImage:[UIImage imageNamed:@"imgLoadBG~iphone"]];
            [self.sizeView addSubview:imageView];
            //设置frame
            [imageView setFrame:CGRectMake(0, MAXY, SCWidth, self.imgHeight)];
            MAXY=CGRectGetMaxY(imageView.frame);
            if (i==self.model.sizeimages.count-1) {
                self.sizeHeight.constant=MAXY;
            }
            
            
        }
    }
    if (self.model.wearimages.count>0) {
        
        CGFloat wearingY=CGRectGetMaxY(self.wearingLabel.frame);
        CGFloat MAXY=wearingY;
        for (int i=0; i<self.model.wearimages.count; i++) {
            //从URL中取出图片宽高
            NSArray *array=[[[[self.model.wearimages[i] stringByDeletingPathExtension] componentsSeparatedByString:@"_"] lastObject] componentsSeparatedByString:@"x"];
            //计算图片高度
            self.imgHeight=SCWidth/([array[0] floatValue]/[array[1] floatValue]);
            
            UIImageView *imageView=[[UIImageView alloc]init];
            [imageView sd_setImageWithURL:[NSURL URLWithString:self.model.wearimages[i]] placeholderImage:[UIImage imageNamed:@"imgLoadBG~iphone"]];
            [self.wearingView addSubview:imageView];
            [imageView setFrame:CGRectMake(0, MAXY, SCWidth, self.imgHeight)];
            MAXY=CGRectGetMaxY(imageView.frame);
            if (i==self.model.wearimages.count-1) {
                self.wearingHeight.constant=MAXY;
            }
            
        }
    }
    
    if (self.model.flatimages.count>0) {
        CGFloat flatY=CGRectGetMaxY(self.flatLabel.frame);
        CGFloat MAXY=flatY;
        for (int i=0; i<self.model.flatimages.count; i++) {
            
            //从URL中取出图片宽高
            NSArray *array=[[[[self.model.flatimages[i] stringByDeletingPathExtension] componentsSeparatedByString:@"_"] lastObject] componentsSeparatedByString:@"x"];
            //计算图片高度
            self.imgHeight=SCWidth/([array[0] floatValue]/[array[1] floatValue]);
            
            UIImageView *imgView=[[UIImageView alloc]init];
            
            [imgView sd_setImageWithURL:[NSURL URLWithString:self.model.flatimages[i]] placeholderImage:[UIImage imageNamed:@"imgLoadBG~iphone"]];
            [self.flatView addSubview:imgView];
            [imgView setFrame:CGRectMake(0, MAXY, SCWidth, self.imgHeight)];
            MAXY=CGRectGetMaxY(imgView.frame);
            if (i==self.model.flatimages.count-1) {
                
                self.flatHeight.constant=MAXY;
            }
        }
    }
    
    if (self.model.detailimages.count>0) {
        CGFloat designY=CGRectGetMaxY(self.designLabel.frame);
        CGFloat MAXY=designY;
        
        for (int i=0; i<self.model.detailimages.count; i++) {
            
            //从URL中取出图片宽高
            NSArray *array=[[[[self.model.detailimages[i] stringByDeletingPathExtension] componentsSeparatedByString:@"_"] lastObject] componentsSeparatedByString:@"x"];
            //计算图片高度
            self.imgHeight=SCWidth/([array[0] floatValue]/[array[1] floatValue]);
            
            UIImageView *imgV=[[UIImageView alloc]init];
            [imgV sd_setImageWithURL:[NSURL URLWithString:self.model.detailimages[i]] placeholderImage:[UIImage imageNamed:@"imgLoadBG~iphone"]];
            [self.designView addSubview:imgV];
            [imgV setFrame:CGRectMake(0, MAXY, SCWidth, self.imgHeight)];
            MAXY=CGRectGetMaxY(imgV.frame);
            if (i==self.model.detailimages.count-1) {
                
                self.designHeight.constant=MAXY;
            }
            
            
        }
    }
    
    self.sizeView.hidden=self.model.sizeimages.count==0;
    
    self.wearingView.hidden=self.model.wearimages.count==0;
    
    self.flatView.hidden=self.model.flatimages.count==0;
    
    self.designView.hidden=self.model.detailimages.count==0;
}

#pragma end

#pragma mark -加载数据
-(void)requestData{

    __weak typeof(self) weakSelf=self;
    [self.httpManager GET:[NSString stringWithFormat:WHOOLALA,self.proDtailApi] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        weakSelf.model=[HotDetailModel yy_modelWithJSON:responseObject];
        
        NSLog(@"productID=========%@",weakSelf.model.product.product_id);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf setupViews];
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error.localizedDescription);
    }];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    self.pageController.currentPage=scrollView.contentOffset.x/SCWidth;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -导航条设置
-(void)setupNavigation{

    UIButton *backBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 42, 42)];
    [backBtn setImage:[UIImage imageNamed:@"back-white~iphone"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:backBtn];
    
    UIImageView *navImg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nav_shadow~iphone"]];
    [navImg setFrame:CGRectMake(0, 0, SCWidth, 64)];
    
    [self.navigationController.navigationBar setBackgroundImage:navImg.image forBarMetrics:UIBarMetricsCompact];
    
    //购物车与分享按钮
    UIButton *shopcarBtn=[[UIButton alloc]initWithFrame:CGRectMake( 0, 0, 42, 42)];
    [shopcarBtn setImage:[UIImage imageNamed:@"shopping~iphone"] forState:UIControlStateNormal];
    [shopcarBtn addTarget:self action:@selector(shopcarClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *shareBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 42, 42)];
    [shareBtn setImage:[UIImage imageNamed:@"share_1"] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(shareBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *shopItem=[[UIBarButtonItem alloc]initWithCustomView:shopcarBtn];
    UIBarButtonItem *shareItem=[[UIBarButtonItem alloc] initWithCustomView:shareBtn];
    
    UIButton *collectBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 42, 42)];
    if (self.model.product.likestatus) {
        [collectBtn setImage:[UIImage imageNamed:@"star"] forState:UIControlStateNormal];
    }else{
        [collectBtn setImage:[UIImage imageNamed:@"star_1"] forState:UIControlStateNormal];
    }
    [collectBtn addTarget:self action:@selector(collectClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *collectItem=[[UIBarButtonItem alloc]initWithCustomView:collectBtn];
    
    
    [self.navigationItem setRightBarButtonItems:@[shopItem,shareItem,collectItem]];
}

-(void)collectClick:(UIButton *)button{

    NSLog(@"%s",__func__);
}

-(void)shareBtnClick{

    NSLog(@"%s",__func__);
}

-(void)shopcarClick{

    NSLog(@"%s",__func__);
}

-(void)backAction{

    [self.navigationController popViewControllerAnimated:YES];
}



-(void)dealloc{


    [self.httpManager.operationQueue cancelAllOperations];
}

@end

//
//  LiDExploreViewController.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/5/30.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDExploreViewController.h"
#import "ZJScrollPageView.h"
#import "LiDMenuTableViewController.h"
#import "LiDLadyViewController.h"
#import "LiDManViewController.h"
#import "LiDHotViewController.h"
#import "LiDBrandViewController.h"


@interface LiDExploreViewController ()<CDRTranslucentSideBarDelegate>

@property (nonatomic, strong) CDRTranslucentSideBar *slideMenu;
/** 标题数组 */
@property(nonatomic,strong)NSArray *titleArray;
/** 控制器数组 */
@property(nonatomic,strong)NSMutableArray *controllerArray;


@end

@implementation LiDExploreViewController

#pragma mark 懒加载
-(CDRTranslucentSideBar *)slideMenu{

    if (!_slideMenu) {
        _slideMenu=[[CDRTranslucentSideBar alloc]init];
    }
    return _slideMenu;
}


-(NSArray *)titleArray{

    if (!_titleArray) {
        _titleArray=@[@"最热",@"品牌",@"男士",@"女士"];
    }
    return _titleArray;
}


-(NSMutableArray *)controllerArray{

    if (!_controllerArray) {
        LiDHotViewController *hot=[[LiDHotViewController alloc]init];
        [hot setTitle:@"最热"];
        LiDBrandViewController *brand=[[LiDBrandViewController alloc]init];
        [brand setTitle:@"品牌"];
        LiDManViewController *man=[[LiDManViewController alloc]init];
        [man setTitle:@"男士"];
        LiDLadyViewController *lady=[[LiDLadyViewController alloc]init];
        [lady setTitle:@"女士"];
        
        _controllerArray=[NSMutableArray array];
        [_controllerArray addObject:hot];
        [_controllerArray addObject:brand];
        [_controllerArray addObject:man];
        [_controllerArray addObject:lady];
    }
    return _controllerArray;
}

#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftMenu];
    [self setupNavigation];
    [self addPageView];
    
}

-(void)setLeftMenu{

    [self.slideMenu setDelegate:self];
    [self.slideMenu setSideBarWidth:300];
    
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITableViewController *menuTableView=[sb instantiateViewControllerWithIdentifier:NSStringFromClass([LiDMenuTableViewController class])];
    
    [self addChildViewController:menuTableView];
    
    
    [self.slideMenu setContentViewInSideBar:menuTableView.view];
}
-(void)setupNavigation{

    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navzuoce"] style:UIBarButtonItemStylePlain target:self action:@selector(menuClick:)]];
    [self.navigationItem setTitleView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Homepage_title_icon"]]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navshopcar"] style:UIBarButtonItemStylePlain target:self action:@selector(shopcarClick:)]];
}

-(void)addPageView{
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    // 缩放标题
    style.scaleTitle = YES;
    // 颜色渐变
    style.gradualChangeTitleColor = YES;
    style.scaleTitle=YES;
    style.titleFont=[UIFont systemFontOfSize:17];
    style.scrollTitle=NO;
    style.normalTitleColor=[UIColor colorWithRed:132/255.0f green:132/255.0f blue:132/255.0f alpha:1];
    style.selectedTitleColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    
    
    ZJScrollPageView *pageView=[[ZJScrollPageView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) segmentStyle:style childVcs:self.controllerArray parentViewController:self];
    [self.view addSubview:pageView];
    
    
    
}

-(void)menuClick:(UIBarButtonItem *)item{

    [self.slideMenu show];
}

-(void)shopcarClick:(UIBarButtonItem *)item{
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -<TYPagerControllerDataSource>
-(NSInteger)numberOfControllersInPagerController{

    return self.controllerArray.count;
}


//#pragma mark -<UITableViewDelegate>
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//
//    return 10;
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (!cell) {
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
//    }
//    return cell;
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

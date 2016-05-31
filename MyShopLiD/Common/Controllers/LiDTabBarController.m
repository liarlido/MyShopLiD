//
//  LiDTabBarController.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/5/30.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDTabBarController.h"
#import "LiDNavigationController.h"
#import "LiDExploreViewController.h"
#import "LiDNewsViewController.h"
#import "LiDLiveViewController.h"
#import "LiDMineViewController.h"

@interface LiDTabBarController ()

@end

@implementation LiDTabBarController

+(void)initialize{
    NSMutableDictionary *attr=[NSMutableDictionary dictionary];
    attr[NSFontAttributeName]=[UIFont systemFontOfSize:12];
    attr[NSForegroundColorAttributeName]=[UIColor grayColor];
    
    NSMutableDictionary *selectedAttr=[NSMutableDictionary dictionary];
    selectedAttr[NSFontAttributeName]=[UIFont systemFontOfSize:12];
    selectedAttr[NSForegroundColorAttributeName]=[UIColor blackColor];
    
    UITabBarItem *item=[UITabBarItem appearance];
    [item setTitleTextAttributes:attr forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar setTintColor:[UIColor whiteColor]];
    [self setUpChildVc:[[LiDExploreViewController alloc]init] title:@"搜索" image:[UIImage imageNamed:@"TabBar_1"] selectedImage:[UIImage imageNamed:@"TabBar_1_1"]];
    [self setUpChildVc:[[LiDNewsViewController alloc]init] title:@"新品" image:[UIImage imageNamed:@"TabBar_3"] selectedImage:[UIImage imageNamed:@"TabBar_1_3"]];
    
    [self setUpChildVc:[[LiDLiveViewController alloc]init] title:@"LIVE" image:[UIImage imageNamed:@"TabBar_4"] selectedImage:[UIImage imageNamed:@"TabBar_1_4"]];
    
    [self setUpChildVc:[[LiDMineViewController alloc]init] title:@"我的" image:[UIImage imageNamed:@"TabBar_5"] selectedImage:[UIImage imageNamed:@"TabBar_1_5"]];
    
}

/**
 *  初始化子视图控制器
 */
-(void)setUpChildVc:(UIViewController *)vc title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage{
    
    [vc.navigationItem setTitle:title];
    [vc.tabBarItem setTitle:title];
    [vc.tabBarItem setImage:image];
    [vc.tabBarItem setSelectedImage:selectedImage];
    
    //    [vc.view setBackgroundColor:[UIColor colorWithRed:223/255.0f green:223/255.0f blue:223/255.0f alpha:1]];
    LiDNavigationController *nav=[[LiDNavigationController alloc]initWithRootViewController:vc];
    //用于所有Navigation
    //    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    //单独对LiDNavigation设置
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_shadow"] forBarMetrics:UIBarMetricsDefault];
    
    [self addChildViewController:nav];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

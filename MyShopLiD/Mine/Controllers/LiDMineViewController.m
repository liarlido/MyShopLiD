//
//  LiDMineViewController.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/5/30.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDMineViewController.h"
#import "LiDSettingViewController.h"

@interface LiDMineViewController ()

@end

@implementation LiDMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigation];
    
}

#pragma mark -导航栏设置
-(void)setupNavigation{

    //设置按钮
    UIButton *setBtn=[[UIButton alloc]initWithFrame:CGRectMake( 0, 0, 32, 32)];
    [setBtn setImage:[UIImage imageNamed:@"edit_1~iphone"] forState:UIControlStateNormal];
    [setBtn addTarget:self action:@selector(settingClick) forControlEvents:UIControlEventTouchUpInside];
    [setBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -10)];
    
    //购物车与分享按钮
    UIButton *shopcarBtn=[[UIButton alloc]initWithFrame:CGRectMake( 0, 0, 32, 32)];
    [shopcarBtn setImage:[UIImage imageNamed:@"shopping~iphone"] forState:UIControlStateNormal];
    [shopcarBtn addTarget:self action:@selector(shopcarClick) forControlEvents:UIControlEventTouchUpInside];
    [shopcarBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -10)];
    
    
    UIButton *shareBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 32, 32)];
    [shareBtn setImage:[UIImage imageNamed:@"share_1~iphone"] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(shopcarClick) forControlEvents:UIControlEventTouchUpInside];
    [shareBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -10)];
    
    UIBarButtonItem *shopItem=[[UIBarButtonItem alloc]initWithCustomView:shopcarBtn];
    UIBarButtonItem *shareItem=[[UIBarButtonItem alloc] initWithCustomView:shareBtn];
    UIBarButtonItem *setItem=[[UIBarButtonItem alloc]initWithCustomView:setBtn];
    
    
    [self.navigationItem setRightBarButtonItems:@[shopItem,shareItem,setItem]];
    
}

-(void)settingClick{

    [self loadTableView];
}

#pragma mark -跳转到设置页面
-(void)loadTableView{

    LiDSettingViewController *settingVC=[[LiDSettingViewController alloc]init];
    [self.navigationController pushViewController:settingVC animated:YES];
}

-(void)shopcarClick{

    [SVProgressHUD showErrorWithStatus:@"功能正在建设中"];
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

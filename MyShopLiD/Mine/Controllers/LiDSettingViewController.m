//
//  LiDSettingViewController.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/8/24.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDSettingViewController.h"

@interface LiDSettingViewController ()

@end

@implementation LiDSettingViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigation];
    [self loadSetTable];
}


#pragma mark -设置导航栏
-(void)setupNavigation{
    
    UIButton *backBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 32, 32)];
    [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [backBtn setImage:[UIImage imageNamed:@"back-white~iphone"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:backBtn];
}

#pragma mark -返回按钮事件
-(void)backAction{
    
    [self.navigationController popViewControllerAnimated:YES];
}

//加载静态表格
-(void)loadSetTable{

    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITableViewController *setTableVC=[sb instantiateViewControllerWithIdentifier:@"LiDSettingTableView"];
    
    [self addChildViewController:setTableVC];
    [self.view addSubview:setTableVC.view];
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

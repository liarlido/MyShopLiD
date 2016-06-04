//
//  LiDMenuTableViewController.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/5/30.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDMenuTableViewController.h"
#import "LoginViewController.h"

@interface LiDMenuTableViewController ()
- (IBAction)loginAction:(UIButton *)sender;

@end

@implementation LiDMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (IBAction)loginAction:(UIButton *)sender {
    LoginViewController *loginVC=[[LoginViewController alloc]init];
    [self presentViewController:loginVC animated:YES completion:nil];
    
}
@end

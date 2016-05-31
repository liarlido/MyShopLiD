//
//  LiDMenuTableViewController.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/5/30.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDMenuTableViewController.h"

@interface LiDMenuTableViewController ()

@end

@implementation LiDMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITableViewController *tableViewController=[sb instantiateViewControllerWithIdentifier:@"LiDMenuTableViewController"];
    self.view=tableViewController.view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

@end

//
//  LiDLadyViewController.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/5/31.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDLadyViewController.h"

@interface LiDLadyViewController ()

@end

@implementation LiDLadyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label=[[UILabel alloc]init];
    [label setText:NSStringFromClass([self class])];
    [label setFrame:CGRectMake(100, 200, 50, 25)];
    [self.view addSubview:label];
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

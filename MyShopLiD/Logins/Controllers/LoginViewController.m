//
//  LoginViewController.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/4.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *wechatLogin;
@property (weak, nonatomic) IBOutlet UIButton *phoneNumLoginBtn;
@property (weak, nonatomic) IBOutlet UIView *phoneBackView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.phoneBackView.layer setBorderColor:[[UIColor whiteColor]CGColor]];
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

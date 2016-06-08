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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *infoLeftEdge;
@property (weak, nonatomic) IBOutlet UIView *infoView;

@property (weak, nonatomic) IBOutlet UITextField *txtPwd;
@property (weak, nonatomic) IBOutlet UITextField *txtPhoneNum;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.phoneNumLoginBtn.layer setBorderColor:[[UIColor whiteColor]CGColor]];
//    [self.txtPhoneNum setBorderStyle:UITextBorderStyleLine];
//    [self.txtPhoneNum.layer setBorderColor:[[UIColor whiteColor]CGColor]];
    [self.txtPhoneNum.layer setShadowColor:[[UIColor whiteColor]CGColor]];
    [self.txtPhoneNum.layer setShadowOffset:CGSizeMake(self.txtPhoneNum.frame.size.width, self.txtPhoneNum.frame.size.height+1)];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)phoneNumClick:(id)sender {
    
    [self.phoneBackView setHidden:YES];
//    [UIView animateWithDuration:2.0f animations:^{
//        self.infoLeftEdge.constant=-self.view.frame.size.width+50;
//    }];
    
    CGRect rect=self.infoView.frame;
    rect.origin.x=0;
    [UIView animateWithDuration:0.2 animations:^{
        
        self.infoView.frame=rect;
    } completion:^(BOOL finished) {
        self.infoLeftEdge.constant=-self.view.frame.size.width+50;
    }];
    
    
    
}
- (IBAction)cancleClick:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:self completion:nil];
    
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

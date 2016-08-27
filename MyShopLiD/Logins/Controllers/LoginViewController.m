//
//  LoginViewController.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/4.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginUserInfo.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *wechatLogin;
@property (weak, nonatomic) IBOutlet UIButton *phoneNumLoginBtn;
@property (weak, nonatomic) IBOutlet UIView *phoneBackView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *infoLeftEdge;
@property (weak, nonatomic) IBOutlet UIView *infoView;

@property (weak, nonatomic) IBOutlet UITextField *txtPwd;
@property (weak, nonatomic) IBOutlet UITextField *txtPhoneNum;

/** httpManager */
@property(nonatomic,strong)AFHTTPSessionManager *manager;
@end

@implementation LoginViewController

#pragma mark -懒加载
-(AFHTTPSessionManager *)manager{
    
    if (!_manager) {
        _manager=[AFHTTPSessionManager manager];
        //响应中原来不包含的  追加进去
        _manager.responseSerializer=[AFHTTPResponseSerializer serializer];
        _manager.responseSerializer.acceptableContentTypes=[_manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    }
    
    return _manager;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.phoneNumLoginBtn.layer setBorderColor:[[UIColor whiteColor]CGColor]];
    [self.txtPhoneNum.layer setShadowColor:[[UIColor whiteColor]CGColor]];
//    [self.txtPhoneNum.layer setShadowOffset:CGSizeMake(self.txtPhoneNum.frame.size.width, self.txtPhoneNum.frame.size.height+1)];
    
    
    
}

#pragma mark -登录按钮事件
- (IBAction)loginClick:(UIButton *)sender {
    
//    NSString *txtUserName=self.txtPhoneNum.text;
//    NSString *txtPwd=self.txtPwd.text;
//    if (txtUserName.length==0||[txtUserName isEqualToString:@""]) {
//        [SVProgressHUD showErrorWithStatus:@"用户名不能为空!"];
//        return;
//    }
//    if (txtPwd.length==0||[txtPwd isEqualToString:@""]) {
//        [SVProgressHUD showErrorWithStatus:@"密码不能为空!"];
//        return;
//    }
    
    [self getLoginStatus];
    
}

#pragma mark -建立登录链接
-(void)getLoginStatus{

    __weak typeof(self) weakSelf=self;
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"j_username"]=@"8618380447953";
    params[@"j_password"]=@"123456";
    params[@"region_code"]=@"86";
    
    [self.manager POST:ILogin parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [weakSelf getLoginStatusSuccess];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:\n%@",error.localizedDescription);
    }];
    
}
#pragma mark -得到登录状态
-(void)getLoginStatusSuccess{
    
    __weak typeof(self) weakSelf=self;
    [self.manager GET:ILogined parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        if (dict[@"success"]) {
            [[NSNotificationCenter defaultCenter]postNotificationName:@"loginStatusChanged" object:nil];
            [SVProgressHUD showWithStatus:@"登录成功"];
            [weakSelf dismissViewControllerAnimated:YES completion:^{
                
                [SVProgressHUD dismiss];
            }];
        }else{
            
            [SVProgressHUD showErrorWithStatus:@"登录失败"];
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.localizedDescription);
    }];
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
    
    [self dismissViewControllerAnimated:YES completion:nil];
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

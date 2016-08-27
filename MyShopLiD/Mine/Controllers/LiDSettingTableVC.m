//
//  LiDSettingTableVC.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/8/24.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDSettingTableVC.h"
#import "LoginUserInfo.h"
#import "LoginViewController.h"

@interface LiDSettingTableVC (){

    LoginUserInfo *_loginUser;
}
/** 头像 */
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
/** 昵称 */
@property (weak, nonatomic) IBOutlet UILabel *nickName;
/** 性别 */
@property (weak, nonatomic) IBOutlet UILabel *gender;
/** 生日 */
@property (weak, nonatomic) IBOutlet UILabel *birthday;
/** 手机号 */
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;
/** 邮箱 */
@property (weak, nonatomic) IBOutlet UILabel *Email;


@end

@implementation LiDSettingTableVC

-(void)awakeFromNib{

    
}


-(void)setupViews{

    [self.headImage sd_setImageWithURL:[NSURL URLWithString:_loginUser.userinfo.imgGroup.avatar] placeholderImage:[UIImage imageNamed:@"biaoti_1~iphone"]];
    if (![_loginUser.user.nickname isEqualToString:@""]&&_loginUser.user.nickname!=nil) {
        
        [self.nickName setText:_loginUser.user.nickname];
    }
    if (![_loginUser.userinfo.gender isEqualToString:@""]&&_loginUser.userinfo.gender!=nil) {
        
        [self.gender setText:_loginUser.userinfo.gender];
    }
    if (![_loginUser.userinfo.birthday isEqualToString:@""]&&_loginUser.userinfo.birthday!=nil) {
        
        [self.birthday setText:_loginUser.userinfo.birthday];
    }else{
        
        [self.birthday setText:@"未填写"];
    }
    if(![_loginUser.userinfo.telenumber isEqualToString:@""]&&_loginUser.userinfo.telenumber!=nil){
    
        NSString *firstStr=[_loginUser.userinfo.telenumber substringWithRange:NSMakeRange(2, 3)];
        NSString *lastStr=[_loginUser.userinfo.telenumber substringWithRange:NSMakeRange(9, 4)];
        [self.phoneNumber setText:[NSString stringWithFormat:@"%@****%@",firstStr,lastStr]];
    }else{
    
        [self.phoneNumber setText:@"未填写"];
    }
    if (![_loginUser.userinfo.email isEqualToString:@""]&&_loginUser.userinfo.email!=nil) {
        
        [self.Email setText:_loginUser.userinfo.email];
    }else{
    
        [self.Email setText:@"未填写"];
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateUserInfo) name:@"loginStatusChanged" object:nil];
    
    BOOL loginStatus=[self getLoginStatus];
    if (loginStatus) {
        [self setupViews];
    }else{
    
        [SVProgressHUD showErrorWithStatus:@"对不起，请先登录"];
        LoginViewController *loginVC=[[LoginViewController alloc]init];
        [self.navigationController presentViewController:loginVC animated:YES completion:nil];
    }
    
}

-(void)updateUserInfo{

    BOOL loginStatus=[self getLoginStatus];
    if (loginStatus) {
        [self setupViews];
    }else{
        
        LoginViewController *loginVC=[[LoginViewController alloc]init];
        [self.navigationController presentViewController:loginVC animated:YES completion:nil];
    }
}

-(BOOL)getLoginStatus{
    LoginUserInfo *loginUser=[NSKeyedUnarchiver unarchiveObjectWithFile:[DocPath stringByAppendingPathComponent:@"loginUser"]];
    if (loginUser.user.nickname==nil||loginUser.userinfo.imgGroup.avatar==nil||[loginUser.user.nickname isEqualToString:@""]||[loginUser.userinfo.imgGroup.avatar isEqualToString:@""]) {
        
        return false;
    }
    else{
        
        _loginUser=loginUser;
        return true;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if(indexPath.section==2&&indexPath.row==1){
    
        NSString *msg=@"确定要注销吗？";
        //注销登录
        UIAlertController *alertVC=[UIAlertController alertControllerWithTitle:@"注销登录" message:msg preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancleAction=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [alertVC dismissViewControllerAnimated:YES completion:nil];
        }];
        
        __block LoginUserInfo *userInfo=[[LoginUserInfo alloc]init];
        __weak typeof(self) weakSelf=self;
        UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"注销" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            if ([NSKeyedArchiver archiveRootObject:userInfo toFile:[DocPath stringByAppendingPathComponent:@"loginUser"]]) {
                
                [[NSNotificationCenter defaultCenter]postNotificationName:@"registed" object:nil];
                [SVProgressHUD showSuccessWithStatus:@"注销成功"];
                [weakSelf.navigationController popToRootViewControllerAnimated:YES];
            }else{
            
                [SVProgressHUD showErrorWithStatus:@"哎呀，出了点小状况"];
            }
            
            
        }];
        
        [alertVC addAction:cancleAction];
        [alertVC addAction:confirmAction];
        
        [self presentViewController:alertVC animated:YES completion:nil];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

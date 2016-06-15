//
//  LiDMenuTableViewController.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/5/30.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDMenuTableViewController.h"
#import "LoginViewController.h"
#import "LoginUserInfo.h"

@interface LiDMenuTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *collectionLabel;
@property (weak, nonatomic) IBOutlet UILabel *favouriteLabel;
@property (weak, nonatomic) IBOutlet UIButton *userNameBtn;
@property (weak, nonatomic) IBOutlet UIImageView *logoImgView;
- (IBAction)loginAction:(UIButton *)sender;

@property(nonatomic,strong)AFHTTPSessionManager *httpManager;

@end



@implementation LiDMenuTableViewController

#pragma mark -懒加载
-(AFHTTPSessionManager *)httpManager{
    
    if (!_httpManager) {
        _httpManager=[AFHTTPSessionManager manager];
        
    }
    
    return _httpManager;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateUserInfo:) name:@"loginStatusChanged" object:nil];
    
}


-(void)updateUserInfo:(NSNotification *)notification{

    [self getUserInfo];
}

-(void)updateViews:(LoginUserInfo *)userInfo{

    [self.userNameBtn setTitle:userInfo.user.nickname forState:UIControlStateNormal];
    self.userNameBtn.enabled=NO;
    self.favouriteLabel.text=[NSString stringWithFormat:@"%ld",userInfo.pickedProductNumber];
    self.collectionLabel.text=[NSString stringWithFormat:@"%ld",userInfo.favorProductNumber];
    
    NSLog(@"%@",userInfo.userinfo.imgGroup.avatar);
    [self.logoImgView sd_setImageWithURL:[NSURL URLWithString:userInfo.userinfo.imgGroup.avatar] placeholderImage:[UIImage imageNamed:@"biaoti_1~iphone"]];
}

-(void)getUserInfo{

    __weak typeof(self) weakSelf=self;
    [self.httpManager GET:IUserInfo parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        LoginUserInfo *loginUser=[LoginUserInfo yy_modelWithJSON:responseObject];
        [weakSelf updateViews:loginUser];
        //存到本地
        [weakSelf writeUserInfoToLocal:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

-(void)writeUserInfoToLocal:(NSDictionary *)responseObject{

    
    
//    responseObject writeToFile:<#(nonnull NSString *)#> atomically:<#(BOOL)#>
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

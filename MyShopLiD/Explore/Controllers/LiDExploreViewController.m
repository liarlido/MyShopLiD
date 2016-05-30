//
//  LiDExploreViewController.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/5/30.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDExploreViewController.h"
#import <LLSlideMenu.h>

@interface LiDExploreViewController (){
    LLSlideMenu *_slideMenu;
}
@end

@implementation LiDExploreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftMenu];
    [self setupNavigation];
}

-(void)setLeftMenu{

    _slideMenu=[[LLSlideMenu alloc]init];
    
    [self.view addSubview:_slideMenu];
    
    [_slideMenu setLl_menuWidth:150.0f];
    [_slideMenu setBackgroundColor:[UIColor lightGrayColor]];
    
    _slideMenu.ll_springDamping = 20;       // 阻力
    _slideMenu.ll_springVelocity = 15;      // 速度
    _slideMenu.ll_springFramesNum = 60;
    
}
-(void)setupNavigation{

    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"zuoce_edit"] style:UIBarButtonItemStylePlain target:self action:@selector(menuClick:)]];
    [self.navigationItem setTitleView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Homepage_title_icon"]]];
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"gouwuche_side"] style:UIBarButtonItemStylePlain target:self action:@selector(shopcarClick:)]];
}

-(void)menuClick:(UIBarButtonItem *)item{

    [_slideMenu ll_openSlideMenu];
}

-(void)shopcarClick:(UIBarButtonItem *)item{
    NSLog(@"%s",__func__);
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

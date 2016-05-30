//
//  LiDLaunchView.m
//  whoolalaLiD
//
//  Created by LiaRLido on 16/5/29.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDLaunchView.h"
#import "LiDTabBarController.h"


@interface LiDLaunchView (){

    LiDTabBarController *_tabBar;
}

@end

@implementation LiDLaunchView

- (void)viewDidLoad {
    [super viewDidLoad];
    _tabBar=[[LiDTabBarController alloc]init];
    [self setAnimation];
}

-(void)setAnimation{
    
    UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"launchimage-logo"]];
    [self.view addSubview:imageView];
    [imageView setCenter:CGPointMake(self.view.center.x, self.view.center.y)];
    
        [UIView animateWithDuration:3 animations:^{
            
           [imageView setTransform:CGAffineTransformMakeScale(0.2, 0.2)];
        } completion:^(BOOL finished) {
            [self presentViewController:_tabBar animated:YES completion:nil];
            [imageView setTransform:CGAffineTransformMakeScale(2.0, 2.0)];
            
        }];
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

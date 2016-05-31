//
//  LiDExploreViewController.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/5/30.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDExploreViewController.h"


@interface LiDExploreViewController ()<CDRTranslucentSideBarDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) CDRTranslucentSideBar *slideMenu;

@end

@implementation LiDExploreViewController

#pragma mark 懒加载
-(CDRTranslucentSideBar *)slideMenu{

    if (!_slideMenu) {
        _slideMenu=[[CDRTranslucentSideBar alloc]init];
    }
    return _slideMenu;
}


#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftMenu];
    [self setupNavigation];
}

-(void)setLeftMenu{

    [self.slideMenu setDelegate:self];
    [self.slideMenu setSideBarWidth:200];
    
    UITableView *tableView=[[UITableView alloc]initWithFrame:self.slideMenu.view.frame style:UITableViewStylePlain];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    
    [self.slideMenu setContentViewInSideBar:tableView];
    
    
}
-(void)setupNavigation{

    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navzuoce"] style:UIBarButtonItemStylePlain target:self action:@selector(menuClick:)]];
    [self.navigationItem setTitleView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Homepage_title_icon"]]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navshopcar"] style:UIBarButtonItemStylePlain target:self action:@selector(shopcarClick:)]];
}

-(void)menuClick:(UIBarButtonItem *)item{

    [self.slideMenu show];
}

-(void)shopcarClick:(UIBarButtonItem *)item{
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark<UITableViewDelegate>
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    return cell;
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

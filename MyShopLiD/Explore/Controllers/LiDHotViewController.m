//
//  LiDHotViewController.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/5/31.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDHotViewController.h"

@interface LiDHotViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
/** collectionView */
@property(nonatomic,strong)UICollectionView *collectionView;

@end

@implementation LiDHotViewController

#pragma mark -懒加载

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTopLine];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)setupTopLine{

    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    [flowLayout setHeaderReferenceSize:CGSizeMake(self.view.frame.size.width, 20)];
    
    self.collectionView=[[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.collectionView setDelegate:self];
    [self.collectionView setDataSource:self];
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
}

#pragma mark -<UICollectionViewDelegate>
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"hotTop"]];
        [imageView setFrame:CGRectMake(0, 0, self.collectionView.frame.size.width, 20)];
        UICollectionReusableView *header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        [header addSubview:imageView];
        return header;
    }
    return nil;
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

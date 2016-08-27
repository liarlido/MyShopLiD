//
//  NewGoodsViewController.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/16.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "NewGoodsViewController.h"
#import "LiDNewsViewController.h"

@interface NewGoodsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *previewImage;
@property (weak, nonatomic) IBOutlet UIButton *buyButton;
@property (weak, nonatomic) IBOutlet UIButton *buyAction;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *highPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;



@property (weak, nonatomic) IBOutlet UIButton *dislikeButton;
@property (weak, nonatomic) IBOutlet UIButton *favouriteButton;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;



@end

@implementation NewGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)dicLikeAction:(id)sender {
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"disLikeAction" object:nil];
    
    
}
- (IBAction)likeAction:(id)sender {
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"likeAction" object:nil];
}


-(void)setModel:(NewProductInfo *)model{

    _model=model;
    [self.previewImage sd_setImageWithURL:[NSURL URLWithString:model.product.imgGroup.x400] placeholderImage:[UIImage imageNamed:@"hp_grad~iphone"]];
    self.productNameLabel.text=model.product.name;
    self.priceLabel.text=[NSString stringWithFormat:@"￥%ld",(long)model.product.lowest_price];
    NSMutableDictionary *attributes=[NSMutableDictionary dictionary];
    attributes[NSStrikethroughStyleAttributeName]=@1;
    NSAttributedString *attrString=[[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@"￥%ld",model.product.highest_price] attributes:attributes];
    self.highPriceLabel.attributedText=attrString;
    self.typeLabel.text=[model.product.categoryInfo firstObject].category.name;
    
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

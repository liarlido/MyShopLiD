//
//  LiDHotCollectionViewCell.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/2.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDHotCollectionViewCell.h"
#import "LiDHotProductModel.h"

@interface LiDHotCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UIView *backView;

@property (weak, nonatomic) IBOutlet UILabel *goodsDesc;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *percentLabel;

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *shopDescLabel;

@end
@implementation LiDHotCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setModel:(LiDHotProductModel *)model{

    _model=model;
    
    self.typeLabel.text=@"类型";
    [self.goodsImageView sd_setImageWithURL:[NSURL URLWithString:model.product.imgGroup.x400] placeholderImage:[UIImage imageNamed:@"headground_1"]];
    
    [self.backView bringSubviewToFront:self.typeLabel];
    
}

@end

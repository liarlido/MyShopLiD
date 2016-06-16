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
    [self.contentView bringSubviewToFront:self.typeLabel];
    self.typeLabel.text=[model.product.categoryInfo lastObject].category.name;
    self.goodsDesc.text=model.product.name;
    self.priceLabel.text=[NSString stringWithFormat:@"￥%.2ld",(long)model.product.lowest_price];
    self.percentLabel.text=[NSString stringWithFormat:@"%ld%%",(long)model.product.likeRatio];
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:model.merchantinfo.merchant.imgGroup.avatar] placeholderImage:[UIImage imageNamed:@"biaoti_1"]];
    self.shopNameLabel.text=model.merchantinfo.merchant.name;
    self.shopDescLabel.text=model.merchantinfo.merchant.merchant_signature.length>0?model.merchantinfo.merchant.merchant_signature:@"";
    
}

@end

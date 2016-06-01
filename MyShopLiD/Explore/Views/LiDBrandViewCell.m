//
//  LiDBrandViewCell.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/1.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDBrandViewCell.h"
#import "LiDBrandModel.h"

@implementation LiDBrandViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(LiDBrandModel *)model{

    _model=model;
    
    [self.brandImage sd_setImageWithURL:[NSURL URLWithString:model.merchantinfo.merchantobj.imgGroup.logo] placeholderImage:[UIImage imageNamed:@"brand-default"]];
//    [self.imageView.layer setMasksToBounds:NO];
    [self.brandImage setContentMode:UIViewContentModeScaleAspectFill];
    
    self.brandName.text=model.merchantinfo.merchantobj.name;
//    [self.brandName.layer setMasksToBounds:NO];
    
    
}

-(void)layoutSubviews{
//
//    [self bringSubviewToFront:self.brandName];
}


@end

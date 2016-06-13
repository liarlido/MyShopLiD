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

-(UIImageView *)brandImage{

    if (!_brandImage) {
        _brandImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, -50, SCWidth, 300)];
    }
    return _brandImage;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(LiDBrandModel *)model{

    _model=model;
    
    [self.brandImage sd_setImageWithURL:[NSURL URLWithString:model.merchantinfo.merchantobj.imgGroup.logo] placeholderImage:[UIImage imageNamed:@"brand-default"]];
//    [self.brandImage setFrame:CGRectMake(0, -(SCHeight * 0.5 - self.height) / 2, SCWidth, SCHeight*0.5)];
    [self.brandImage setContentMode:UIViewContentModeScaleAspectFill];
    [self.contentView insertSubview:self.brandImage atIndex:0];
    
    
    self.brandName.text=model.merchantinfo.merchantobj.name;
}


-(void)cellOffset{
//    [self.brandImage setFrame:CGRectMake(0, -(SCHeight * 0.5 - self.height) / 2, SCWidth, SCHeight*0.5)];
    // 1、获取cell在屏幕中的rect
    CGRect  centerToWindow = [self convertRect:self.bounds toView:self.window];
    // 2、获取cell中心点y轴坐标
    CGFloat centerY        = CGRectGetMidY(centerToWindow);
    // 3、获取cell父视图的中心点
    CGPoint windowCenter   = self.superview.center;
    // 4、获取距离差
    CGFloat cellOffsetY = centerY - windowCenter.y;
    // 5、距离差 / 2倍父视图高度
    CGFloat offsetDig =  cellOffsetY / self.superview.frame.size.height*2 ;
    // 6、计算偏移 kScreenHeight * 0.5 为图片视图的高度
    CGFloat offset    =  -offsetDig * (SCHeight * 0.5-250) / 2;
    
//    CGFloat offset=10;
    
    CGAffineTransform transY   = CGAffineTransformMakeTranslation(0, offset);
    self.brandImage.transform = transY;
    
    
}

-(void)layoutSubviews{

    
}


@end

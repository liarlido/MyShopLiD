//
//  LiDManCell.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/3.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDManCell.h"

@interface LiDManCell()

@property (strong, nonatomic)UIImageView *preImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation LiDManCell

-(UIImageView *)preImageView{

    if (!_preImageView) {
        _preImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCWidth, 200)];
    }
    return _preImageView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(void)setModel:(postObjectInfo *)model{

    _model=model;
    [self.preImageView sd_setImageWithURL:[NSURL URLWithString:model.coverImg] placeholderImage:[UIImage imageNamed:@"hp_grad"]];
    [self.contentView insertSubview:self.preImageView atIndex:0];
    self.titleLabel.text=model.title;
    self.dateLabel.text=model.monthDay;
//    [self layoutIfNeeded];
//    model.cellHeight=200;
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
    CGFloat offset    =  -offsetDig * (SCHeight * 0.5-300) / 2;
    
    CGAffineTransform transY   = CGAffineTransformMakeTranslation(0, offset);
    self.preImageView.transform = transY;
    
    
}

@end

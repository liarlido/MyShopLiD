//
//  LiDManViewCell.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/3.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDManViewCell.h"
#import "LiDHotProductModel.h"
#import "ProductModel.h"


@interface LiDManViewCell()

@property (strong, nonatomic) UIImageView *preImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIView *productView;
@property (weak, nonatomic) IBOutlet UIImageView *proImg1;
@property (weak, nonatomic) IBOutlet UIImageView *proImg2;
@property (weak, nonatomic) IBOutlet UIImageView *proImg3;

@property (weak, nonatomic) IBOutlet UILabel *proNameLabel1;
@property (weak, nonatomic) IBOutlet UILabel *proNameLabel2;
@property (weak, nonatomic) IBOutlet UILabel *proNameLabel3;
@property(nonatomic,strong)ProductModel *productModel;
@end

@implementation LiDManViewCell

-(UIImageView *)preImageView{

    if (!_preImageView) {
        _preImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCWidth, 400)];
    }
    return _preImageView;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(postObjectInfo *)model{

    _model=model;
    
    
    [self.preImageView sd_setImageWithURL:[NSURL URLWithString:model.coverImg] placeholderImage:[UIImage imageNamed:@"hp_grad"]];
    [self.contentView insertSubview:self.preImageView atIndex:0];
    
    self.titleLabel.text=model.title;
    self.dateLabel.text=model.monthDay;
    if (model.productsInfo.count>0) {
        //真J8 LOW!!!!!!!!!!
        LiDHotProductModel *hotModel1=model.productsInfo[0];
        [self.proImg1 sd_setImageWithURL:[NSURL URLWithString:hotModel1.product.imgGroup.x66] placeholderImage:[UIImage imageNamed:@"hp_grad"]];
        self.proNameLabel1.text=hotModel1.product.name;
        
        LiDHotProductModel *hotModel2=model.productsInfo[1];
        [self.proImg2 sd_setImageWithURL:[NSURL URLWithString:hotModel2.product.imgGroup.x236] placeholderImage:[UIImage imageNamed:@"hp_grad"]];
        self.proNameLabel2.text=hotModel2.product.name;
        
        
        LiDHotProductModel *hotModel3=model.productsInfo[2];
        [self.proImg3 sd_setImageWithURL:[NSURL URLWithString:hotModel3.product.imgGroup.x400] placeholderImage:[UIImage imageNamed:@"hp_grad"]];
        self.proNameLabel3.text=hotModel3.product.name;
    }else{
    
        [self.productView setHidden:YES];
    }
    
//    [self layoutIfNeeded];
//    model.cellHeight=400;
    
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

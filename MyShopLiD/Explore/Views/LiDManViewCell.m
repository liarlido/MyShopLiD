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

@property (weak, nonatomic) IBOutlet UIImageView *preImageView;
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
    }
    
//    [self layoutIfNeeded];
//    model.cellHeight=400;
    
}

@end

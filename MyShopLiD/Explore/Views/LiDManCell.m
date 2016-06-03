//
//  LiDManCell.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/3.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDManCell.h"

@interface LiDManCell()

@property (weak, nonatomic) IBOutlet UIImageView *preImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation LiDManCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end

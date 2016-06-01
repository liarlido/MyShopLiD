//
//  LiDBrandViewCell.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/1.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LiDBrandModel;
@interface LiDBrandViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *brandImage;
@property (weak, nonatomic) IBOutlet UILabel *brandName;
/** 品牌模型 */
@property(nonatomic,strong)LiDBrandModel *model;


@end

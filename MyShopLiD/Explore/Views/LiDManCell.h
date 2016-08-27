//
//  LiDManCell.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/3.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "postObjectInfo.h"

@interface LiDManCell : UITableViewCell
@property(nonatomic,strong)postObjectInfo *model;
/** 偏移单元格 */
- (void)cellOffset;

@end

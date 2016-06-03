//
//  postObjectInfo.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/3.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LiDHotProductModel.h"

@interface postObjectInfo : NSObject

@property(nonatomic,copy)NSString *coverImg;


@property(nonatomic,copy)NSString *title;


@property(nonatomic,assign)NSInteger ID;


@property(nonatomic,copy)NSString *monthDay;


@property(nonatomic,copy)NSString *type;


@property(nonatomic,strong)NSArray<LiDHotProductModel *> *productsInfo;

@end

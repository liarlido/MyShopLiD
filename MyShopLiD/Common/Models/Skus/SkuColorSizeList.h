//
//  SkuColorSizeList.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/6.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "skuColor.h"
#import "skuSize.h"

@interface SkuColorSizeList : NSObject

@property(nonatomic,strong)NSArray<skuColor *> *skucolorlist;


@property(nonatomic,strong)NSArray<skuSize *> *skusizelist;

@end

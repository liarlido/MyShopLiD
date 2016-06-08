//
//  SkuColorSizeList.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/6.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "SkuColorSizeList.h"

@implementation SkuColorSizeList


+(NSDictionary *)modelContainerPropertyGenericClass{
    
    return @{@"skucolorlist":[skuColor class],@"skusizelist":[skuSize class]};
}



@end

//
//  LiDHotProductModel.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/2.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDHotProductModel.h"
#import "MechantInfo.h"
#import "ProductModel.h"

@implementation LiDHotProductModel


+(NSDictionary *)modelContainerPropertyGenericClass{
    
    return @{@"merchantinfo":[MechantInfo class],@"product":[ProductModel class]};
}

@end

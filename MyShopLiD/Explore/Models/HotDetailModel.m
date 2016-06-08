//
//  HotDetailModel.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/6.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "HotDetailModel.h"


@implementation HotDetailModel

+(NSDictionary *)modelContainerPropertyGenericClass{
    
    return @{@"recommendProducts":[recommendProduct class],@"categorylist":[CategoryModel class]};
}


+ (NSArray *)modelPropertyBlacklist {
    return @[@"productcategory", @"skusinfo"];
}

@end

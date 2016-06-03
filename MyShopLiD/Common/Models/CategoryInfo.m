//
//  CategoryInfo.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/2.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "CategoryInfo.h"


@implementation CategoryInfo

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"category":[CategoryModel class],@"parentCategory":[ParentCategory class]};
}

@end

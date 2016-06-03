//
//  ParentCategory.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/2.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "ParentCategory.h"
#import "CategoryModel.h"

@implementation ParentCategory

+ (NSDictionary *)objectClassInArray{
    return @{@"parentCategory" : [ParentCategory class]};
}

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"category":[CategoryModel class]};
}

@end

//
//  CategoryModel.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/2.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel

+(NSDictionary *)modelCustomPropertyMapper{
    return @{@"desc":@"description",@"cateid":@"id",@"cateClass":@"class"};
}


@end
@implementation Parent_Category

+(NSDictionary *)modelCustomPropertyMapper{
    return @{@"parentid":@"id",@"parentClass":@"class"};
}

@end



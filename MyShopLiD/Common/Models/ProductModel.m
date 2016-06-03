//
//  ProductModel.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/2.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "ProductModel.h"


@implementation ProductModel

+(NSDictionary *)modelCustomPropertyMapper{
    return @{@"proid":@"id"};
}


+ (NSDictionary *)objectClassInArray{
    return @{@"categoryInfo" : [CategoryInfo class]};
}

+(NSDictionary *)modelContainerPropertyGenericClass{
    
    return @{@"categoryInfo":[CategoryInfo class]};
}


@end



@implementation ProImggroup

@end




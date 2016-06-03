//
//  MechantModel.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/2.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "MechantModel.h"

@implementation MechantModel

+(NSDictionary *)modelCustomPropertyMapper{
    return @{@"meid":@"id"};
}

//+(NSDictionary *)modelContainerPropertyGenericClass{
//    
//    return @{@"imgGroup":[MeImggroup class],@"urlInfo":[MeUrlinfo class]};
//}


@end


@implementation MeImggroup

@end


@implementation MeUrlinfo

@end



//
//  LiDBrandModel.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/1.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDBrandModel.h"

@implementation LiDBrandModel

+(NSDictionary *)modelCustomPropertyMapper{
    return @{@"desc":@"description"};
}

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"merchantobj":[Merchantobj class],@"Images":[Imggroup class],@"Urlinfo":[Urlinfo class]};
}



@end
@implementation Imggroup

@end


@implementation Urlinfo

@end


@implementation Merchantinfo

@end


@implementation Merchantobj

@end



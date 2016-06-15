//
//  LoginUserInfo.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/15.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LoginUserInfo.h"


@implementation LoginUserInfo

// 如果实现了该方法，则处理过程中不会处理该列表外的属性。
+ (NSArray *)modelPropertyBlacklist {
    return @[@"shopinfo",@"followStatus",@"urbanAirShipID"];
}

@end

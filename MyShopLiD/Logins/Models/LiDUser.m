//
//  LiDUser.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/15.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDUser.h"

@implementation LiDUser

//返回一个 Dict，将 Model 属性名对映射到 JSON 的 Key。
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"uid":@"id",@"uclass":@"class"};
}


@end

//
//  LiDUserInfo.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/15.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDUserInfo.h"

@implementation LiDUserInfo

//返回一个 Dict，将 Model 属性名对映射到 JSON 的 Key。
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"uid":@"id",@"uclass":@"class"};
}
// 如果实现了该方法，则处理过程中不会处理该列表内的属性。
+ (NSArray *)modelPropertyBlacklist {
    return @[@"urlInfo"];
}

@end
@implementation uUrlinfo

@end


@implementation uImggroup

@end



//
//  LiDUser.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/15.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDUser.h"


@implementation LiDUser

-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    NSArray *array=[NSArray getAllIvars:[self class]];
    if (array.count>0) {
        for (int i=0; i<array.count; i++) {
            id value=[self valueForKey:array[i]];

            [aCoder encodeObject:value forKey:array[i]];
        }
    }
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if (self=[super init]) {
        NSArray *array=[NSArray getAllIvars:[self class]];
        if (array.count>0) {
            for (int i=0; i<array.count; i++) {
                
                [self setValue:[aDecoder decodeObjectForKey:array[i]] forKey:array[i]];
            }
        }
    }
    return self;
}


//返回一个 Dict，将 Model 属性名对映射到 JSON 的 Key。
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"uid":@"id",@"uclass":@"class"};
}


@end

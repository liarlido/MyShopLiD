//
//  LiDUserInfo.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/15.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "LiDUserInfo.h"

@implementation LiDUserInfo


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
// 如果实现了该方法，则处理过程中不会处理该列表内的属性。
+ (NSArray *)modelPropertyBlacklist {
    return @[@"urlInfo"];
}

@end
@implementation uUrlinfo
-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    NSArray *array=[NSArray getAllIvars:[self class]];
    if (array.count>0) {
        for (int i=0; i<array.count; i++) {
            
            id value=[self valueForKey:array[i]];
            [aCoder encodeObject:value forKey:array[i]];
        }
    }
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
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
@end


@implementation uImggroup
-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    NSArray *array=[NSArray getAllIvars:[self class]];
    if (array.count>0) {
        for (int i=0; i<array.count; i++) {
            
            id value=[self valueForKey:array[i]];
            [aCoder encodeObject:value forKey:array[i]];
        }
    }
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
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
@end



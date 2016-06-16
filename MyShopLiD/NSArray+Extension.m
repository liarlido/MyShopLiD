//
//  NSArray+Extension.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/15.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "NSArray+Extension.h"
#import <objc/runtime.h>

@implementation NSArray(Extension)

+(instancetype)getAllProperties:(Class )aClass{

    unsigned int count=0;
    objc_property_t *properties=class_copyPropertyList(aClass, &count);
    NSMutableArray *propertyArray=[NSMutableArray array];
    for (int idx=0; idx<count; idx++) {
        objc_property_t property=properties[idx];
        
        const char *propertyName=property_getName(property);
        NSString *cName=[NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
        [propertyArray addObject:cName];
        
    }
    return propertyArray;
}


+(instancetype)getAllIvars:(Class)aClass{

    unsigned int outCount = 0;
    Ivar * ivars = class_copyIvarList(aClass, &outCount);
    NSMutableArray *ivarArray=[NSMutableArray array];
    for (unsigned int i = 0; i < outCount; i ++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        NSString *iVarName=[NSString stringWithCString:name encoding:NSUTF8StringEncoding];
        [ivarArray addObject:iVarName];
    }
    free(ivars);
    return ivarArray;
}

@end

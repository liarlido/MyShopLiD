//
//  NSArray+Extension.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/15.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray(Extension)

+(instancetype)getAllProperties:(Class )aClass;

+(instancetype)getAllIvars:(Class) aClass;

@end

//
//  skuSize.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/6.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <Foundation/Foundation.h>

@class sizeUser;
@interface skuSize : NSObject


@property (nonatomic, copy) NSString *lastUpdated;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *dateCreated;

@property (nonatomic, copy) NSString *class;

@property (nonatomic, assign) BOOL delete_status;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) sizeUser *user;


@end
@interface sizeUser : NSObject

@property (nonatomic, copy) NSString *class;

@property (nonatomic, assign) NSInteger id;

@end


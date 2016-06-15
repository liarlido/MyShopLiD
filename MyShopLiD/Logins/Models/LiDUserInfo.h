//
//  LiDUserInfo.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/15.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <Foundation/Foundation.h>

@class uUrlinfo,uImggroup;
@interface LiDUserInfo : NSObject

@property (nonatomic, copy) NSString *birthday;

@property (nonatomic, copy) NSString *company;

@property (nonatomic, strong) uUrlinfo *urlInfo;

@property (nonatomic, copy) NSString *school;

@property (nonatomic, copy) NSString *weiboaccounts;

@property (nonatomic, copy) NSString *custom_url;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *telenumber;

@property (nonatomic, copy) NSString *indentification_number;

@property (nonatomic, copy) NSString *dateCreated;

@property (nonatomic, assign) BOOL is_custom_url;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, copy) NSString *home_address;

@property (nonatomic, assign) NSInteger user;

@property (nonatomic, copy) NSString *email;

@property (nonatomic, assign) NSInteger points;

@property (nonatomic, copy) NSString *custom_signature;

@property (nonatomic, copy) NSString *occupation;

@property (nonatomic, copy) NSString *random_url;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *lastUpdated;

@property (nonatomic, strong) uImggroup *imgGroup;

@property (nonatomic, assign) NSInteger version;

@property (nonatomic, copy) NSString *qq_number;

@end
@interface uUrlinfo : NSObject

@property (nonatomic, copy) NSString *profile;

@end

@interface uImggroup : NSObject

@property (nonatomic, copy) NSString *avatar;

@end


//
//  LiDBrandModel.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/1.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Imggroup,Urlinfo;
@class Merchantinfo,Merchantobj,Imggroup,Urlinfo;
@interface LiDBrandModel : NSObject


@property (nonatomic, strong) Merchantinfo *merchantinfo;



@end

@interface Merchantinfo : NSObject

@property (nonatomic, copy) NSString *profileURL;

@property (nonatomic, strong) Merchantobj *merchantobj;

@property (nonatomic, copy) NSString *redirectURL;

@end

@interface Merchantobj : NSObject

@property (nonatomic, copy) NSString *dateCreated;

@property (nonatomic, copy) NSString *found_time;

@property (nonatomic, strong) Imggroup *imgGroup;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *logo;

@property (nonatomic, copy) NSString *remark;

@property (nonatomic, assign) NSInteger sales_volume;

@property (nonatomic, copy) NSString *custom_url;

@property (nonatomic, copy) NSString *major_market;

@property (nonatomic, assign) NSInteger sales_amount;

@property (nonatomic, copy) NSString *target_customer_age;

@property (nonatomic, copy) NSString *telephone;

@property (nonatomic, copy) NSString *returned_address;

@property (nonatomic, copy) NSString *wechat;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, strong) Urlinfo *urlInfo;

@property (nonatomic, copy) NSString *alipay;

@property (nonatomic, copy) NSString *lastUpdated;

@property (nonatomic, copy) NSString *bank_account_name;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *random_url;

@property (nonatomic, assign) NSInteger validation_status;

@property (nonatomic, assign) BOOL delete_status;

@property (nonatomic, copy) NSString *email;

@property (nonatomic, copy) NSString *opening_bank;

@property (nonatomic, assign) NSInteger product_population;

@property (nonatomic, copy) NSString *receiver;

@property (nonatomic, copy) NSString *settlement_method;

@property (nonatomic, copy) NSString *delivery_company;

@property (nonatomic, copy) NSString *major_products;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger products_amount;

@property (nonatomic, copy) NSString *target_customer_gender;

@property (nonatomic, copy) NSString *bank_account;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, assign) NSInteger create_user;

@property (nonatomic, assign) NSInteger followers_amount;

@property (nonatomic, assign) BOOL active_status;

@property (nonatomic, copy) NSString *merchant_signature;

@property (nonatomic, copy) NSString *paypal;

@end

@interface Imggroup : NSObject

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *logo;

@end

@interface Urlinfo : NSObject

@property (nonatomic, copy) NSString *profile;

@end


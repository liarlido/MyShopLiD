//
//  LiDUser.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/15.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LiDUser : NSObject<NSCoding>


@property (nonatomic, copy) NSString *uid;

@property (nonatomic, assign) NSInteger delete_status;

@property (nonatomic, assign) BOOL accountLocked;

@property (nonatomic, assign) BOOL is_active;

@property (nonatomic, assign) BOOL passwordExpired;

@property (nonatomic, copy) NSString *password;

@property (nonatomic, assign) BOOL enabled;

@property (nonatomic, copy) NSString *username;

@property (nonatomic, assign) BOOL accountExpired;

@property (nonatomic, copy) NSString *uclass;

@property (nonatomic, copy) NSString *client;

@property (nonatomic, copy) NSString *nickname;


@end

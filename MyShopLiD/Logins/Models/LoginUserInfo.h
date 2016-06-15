//
//  LoginUserInfo.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/15.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LiDUser.h"
#import "LiDUserInfo.h"
@interface LoginUserInfo : NSObject

/** 用户 */
@property(nonatomic,strong)LiDUser *user;
/** 用户信息 */
@property(nonatomic,strong)LiDUserInfo *userinfo;
/** 喜欢数量 */
@property(nonatomic,assign)NSInteger pickedProductNumber;
/** 收藏数量 */
@property(nonatomic,assign)NSInteger favorProductNumber;
/** 粉丝数 */
@property(nonatomic,assign)NSInteger followersNum;
/** 关注数量 */
@property(nonatomic,assign)NSInteger followingNum;

@end

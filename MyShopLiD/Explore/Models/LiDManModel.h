//
//  LiDManModel.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/3.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "postObjectInfo.h"

@interface LiDManModel : NSObject


@property(nonatomic,strong)NSArray<postObjectInfo *> *postObjectInfo;


@property(nonatomic,assign)NSInteger totalPage;


@property(nonatomic,copy)NSString *currentPage;

@end

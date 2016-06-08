//
//  recommendProduct.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/6.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RecImgGroup;

@interface recommendProduct : NSObject


@property(nonatomic,assign)NSInteger recommandID;


@property(nonatomic,copy)NSString *name;


@property(nonatomic,copy)NSString *productDetailAPI;

@property(nonatomic,copy)NSString *productURL;


@property(nonatomic,strong)RecImgGroup *imgGroup;

@end

@interface RecImgGroup : NSObject


@property(nonatomic,copy)NSString *original;
@property(nonatomic,copy)NSString *x236;
@property(nonatomic,copy)NSString *x400;
@property(nonatomic,copy)NSString *x66;


@end

//
//  NewProductInfo.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/16.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductModel.h"

@interface NewProductInfo : NSObject

@property(nonatomic,copy)NSString *colldateCode;

@property(nonatomic,strong)ProductModel *product;

@property(nonatomic,copy)NSString *productDetailsURL;

@property(nonatomic,assign)CGFloat productPrice;

@property(nonatomic,assign)CGFloat productTinderPrice;

@end

//
//  skuModel.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/6.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductModel.h"
#import "skuColor.h"
#import "skuSize.h"

@interface skuModel : NSObject

@property (nonatomic, copy) NSString *sku_id;

@property (nonatomic, assign) NSInteger quantity;

@property (nonatomic, assign) NSInteger original_price;

@property (nonatomic, assign) NSInteger skuid;

@property (nonatomic, assign) NSInteger current_price;

@property (nonatomic, copy) NSString *sku_code;

@property (nonatomic, assign) NSInteger tinder_price;

@property (nonatomic, assign) NSInteger commission;

@property (nonatomic, assign) BOOL delete_status;

@property (nonatomic, assign) NSInteger version;

@property (nonatomic, assign) BOOL is_tinder;

@property(nonatomic,strong)ProductModel *product;

@property(nonatomic,strong)skuColor *color;

@property(nonatomic,strong)skuSize *size;


@end
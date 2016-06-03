//
//  LiDHotProductModel.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/2.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MechantInfo.h"
#import "ProductModel.h"

@interface LiDHotProductModel : NSObject


@property(nonatomic,strong)MechantInfo *merchantinfo;


@property(nonatomic,strong)ProductModel *product;

@property(nonatomic,strong)id product_shops;

@property(nonatomic,copy)NSString *productDetailAPI;

@property(nonatomic,copy)NSString *productURL;

@end

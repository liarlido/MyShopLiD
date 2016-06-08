//
//  HotDetailModel.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/6.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "recommendProduct.h"
#import "ProductModel.h"
#import "MechantInfo.h"
#import "CategoryModel.h"
#import "SkuColorSizeList.h"

@interface HotDetailModel : NSObject


@property(nonatomic,strong)NSArray<recommendProduct *> *recommendProducts;

@property(nonatomic,strong)ProductModel *product;

@property(nonatomic,strong)NSArray *introimages;

@property(nonatomic,strong)NSArray *wearimages;

@property(nonatomic,strong)NSArray *flatimages;

@property(nonatomic,strong)NSArray *detailimages;

@property(nonatomic,strong)NSArray *sizeimages;

@property(nonatomic,strong)NSArray<CategoryModel *> *categorylist;

@property(nonatomic,strong)MechantInfo *merchantinfo;

@property(nonatomic,copy)NSString *keywordString;

@property(nonatomic,strong)SkuColorSizeList *skucolorsizelist;

@property(nonatomic,copy)NSString *shopinfo;

@property(nonatomic,copy)NSString *is_tinder;





@end

//
//  ProductModel.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/2.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MechantModel.h"
#import "CategoryInfo.h"

@class ProImggroup;
@interface ProductModel : NSObject

@property (nonatomic, assign) NSInteger pickedNum;

@property (nonatomic, assign) NSInteger create_user;

@property (nonatomic, copy) NSString *pre_img_height;

@property (nonatomic, copy) NSString *short_description;

@property (nonatomic, copy) NSString *tinder_image;

@property (nonatomic, assign) BOOL on_sales;

@property (nonatomic, strong) NSArray *urlInfo;

@property (nonatomic, assign) BOOL likestatus;

@property (nonatomic, assign) NSInteger likeNum;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger version;

@property (nonatomic, assign) NSInteger proid;

@property (nonatomic, copy) NSString *product_id;

@property (nonatomic, assign) NSInteger likeRatio;

@property (nonatomic, copy) NSString *dominant_color;

@property (nonatomic, assign) NSInteger lowest_price;

@property (nonatomic, strong) ProImggroup *imgGroup;

@property (nonatomic, assign) NSInteger highest_price;

@property (nonatomic, copy) NSString *preview_image;

@property (nonatomic, assign) NSInteger sales_amount;

@property (nonatomic, assign) NSInteger shipping_fee;

@property (nonatomic, copy) NSString *shippingFeeType;

@property (nonatomic, copy) NSString *pre_img_width;

@property (nonatomic, copy) NSString *long_description;

@property (nonatomic, copy) NSString *product_code;

@property (nonatomic, strong) NSArray<CategoryInfo *> *categoryInfo;

@property (nonatomic, strong) MechantModel *merchant;


@end

@interface ProImggroup : NSObject

@property (nonatomic, copy) NSString *original;

@property (nonatomic, copy) NSString *x236;

@property (nonatomic, copy) NSString *x400;

@property (nonatomic, copy) NSString *x66;

@end



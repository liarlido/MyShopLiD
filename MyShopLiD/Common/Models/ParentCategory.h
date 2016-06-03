//
//  ParentCategory.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/2.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CategoryModel.h"


@interface ParentCategory : NSObject


@property(nonatomic,strong)CategoryModel *category;

@property(nonatomic,strong)NSArray *parentCategory;

@end

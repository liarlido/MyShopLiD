//
//  CategoryModel.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/2.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Parent_Category;
@interface CategoryModel : NSObject


@property (nonatomic, strong) Parent_Category *parent_category;

@property (nonatomic, copy) NSString *lastUpdated;

@property (nonatomic, copy) NSString *name_en;

@property (nonatomic, assign) NSInteger cateid;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *dateCreated;

@property (nonatomic, copy) NSString *cateClass;

@property (nonatomic, copy) NSString *headImgUrl;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *name;



@end
@interface Parent_Category : NSObject

@property (nonatomic, copy) NSString *parentClass;

@property (nonatomic, assign) NSInteger parentid;

@end


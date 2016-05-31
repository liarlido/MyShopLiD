//
//  LiDSegmentController.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/5/31.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiDSegmentController : UISegmentedControl

/** titleArray */
@property(nonatomic,strong)NSArray *titleArray;
/** controllerArray */
@property(nonatomic,strong)NSArray *controllerArray;
/** selectedIndex */
@property(nonatomic,assign)NSInteger *selectedIndex;
/** textColor */
@property(nonatomic,strong)UIColor *color;
/** selectedTextColor */
@property(nonatomic,strong)UIColor *selectedColor;
/** fontSize */
@property(nonatomic,assign)NSInteger *fontSize;
/** selectedFontSize */
@property(nonatomic,assign)NSInteger *selectedFontSize;
/** segmentBackgroundColor */
@property(nonatomic,strong)UIColor *bgColor;

-(instancetype)initWithTitles:(NSArray *)titleArray controllers:(NSArray *)controllerArray;

@end

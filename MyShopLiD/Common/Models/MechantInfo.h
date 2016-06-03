//
//  MechantInfo.h
//  MyShopLiD
//
//  Created by LiaRLido on 16/6/2.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MechantModel.h"

@interface MechantInfo : NSObject
/** 商家 */
@property(nonatomic,strong)MechantModel *merchant;

@property(nonatomic,copy)NSString *redirectURL;

@end

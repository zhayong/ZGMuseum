//
//  ShoppingMallModel.h
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/22.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//  每个商品模型

#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>

@interface ShoppingMallModel : NSObject

@property (strong,nonatomic) NSString *iconName;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *introduction;
@property (assign,nonatomic) NSInteger saleCount;
@property (strong,nonatomic) NSString *price;

@end

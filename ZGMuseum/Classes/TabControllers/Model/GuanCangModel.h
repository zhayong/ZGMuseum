//
//  GuanCangModel.h
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/21.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//  馆藏模型

#import <Foundation/Foundation.h>

@interface GuanCangModel : NSObject

// 馆藏名称
@property (nonatomic,strong) NSString *name;
// 馆藏图片
@property (nonatomic,strong) NSString *imageName;
// 馆藏简介
@property (nonatomic,strong) NSString *introduction;


@end

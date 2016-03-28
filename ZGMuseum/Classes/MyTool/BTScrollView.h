//
//  BTScrollView.h
//  BTMuseumPlatform
//
//  Created by songxiaobo on 15/2/6.
//  Copyright (c) 2015年 zhayong. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface BTScrollView : UIScrollView

+ (instancetype)scrollViewWithFrame:(CGRect)frame pictureArray:(NSArray *)pictureArray  introductionArray:(NSArray *)introductionArray;

@end

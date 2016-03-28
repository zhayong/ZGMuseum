//
//  BaseViewController.h
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/21.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseViewController;

@protocol BaseViewControllerDelegate <NSObject>

- (void)dismissViewController:(BaseViewController *)baseVc;

@end

@interface BaseViewController : UIViewController

@property(nonatomic,weak) id<BaseViewControllerDelegate> baseVcDelegate;

-(void)setTitlelable:(NSString *)title;

@end

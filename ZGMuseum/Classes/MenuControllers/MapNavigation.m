//
//  MapNavigation.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/21.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "MapNavigation.h"

@interface MapNavigation ()<BaseViewControllerDelegate>

@end

@implementation MapNavigation

- (void)viewDidLoad {
    [super viewDidLoad];
    self.baseVcDelegate = self;
    [self setTitlelable:@"地图导航"];
    // Do any additional setup after loading the view.
}

#pragma mark - BaseViewControllerDelegate
- (void)dismissViewController:(BaseViewController *)baseVc
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];

}

@end

//
//  TransportationGuide.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/21.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "TransportationGuide.h"

@interface TransportationGuide ()<BaseViewControllerDelegate>

@end

@implementation TransportationGuide

- (void)viewDidLoad {
    [super viewDidLoad];
    self.baseVcDelegate = self;
    [self setTitlelable:@"交通指南"];
    // Do any additional setup after loading the view.
}

#pragma mark - BaseViewControllerDelegate

- (void)dismissViewController:(BaseViewController *)baseVc
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];

}



@end

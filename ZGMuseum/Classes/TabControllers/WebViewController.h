//
//  WebViewController.h
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/23.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface WebViewController : BaseViewController

@property(nonatomic,strong) NSString *urlstr;
@property (strong,nonatomic) NSString *titleName;

@end

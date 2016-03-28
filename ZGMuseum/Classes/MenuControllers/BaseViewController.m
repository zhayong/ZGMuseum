//
//  BaseViewController.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/21.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property(nonatomic,strong) UILabel *titleLable;

@end

@implementation BaseViewController

- (BOOL)prefersStatusBarHidden
{
    return YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    UIButton *back = [[UIButton alloc]init];
    back.frame = CGRectMake(0, 0, 44, 44);
    [back setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
//    [back setTitle:@"返回" forState:UIControlStateNormal];
//    [back setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    // Do any additional setup after loading the view.
}

- (void)setTitlelable:(NSString *)title
{
    self.titleLable = [[UILabel alloc]init];
    self.titleLable.frame = CGRectMake(44, 0, self.view.frame.size.width - 88, 44);
    self.titleLable.text = title;
    self.titleLable.textAlignment = NSTextAlignmentCenter;
    self.titleLable.font = [UIFont boldSystemFontOfSize:16];
    [self.view addSubview:self.titleLable];
}

- (void)backButtonClicked:(UIButton *)sender
{
    [self.baseVcDelegate dismissViewController:self];
}


@end

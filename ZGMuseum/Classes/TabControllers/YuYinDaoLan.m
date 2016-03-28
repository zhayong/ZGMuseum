//
//  YuYinDaoLan.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/18.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "YuYinDaoLan.h"

@interface YuYinDaoLan ()

@end

@implementation YuYinDaoLan

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = self.view.frame;
    imageView.image = [UIImage imageNamed:@"scanImage"];
    [self.view addSubview:imageView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

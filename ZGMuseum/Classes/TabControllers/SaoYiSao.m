//
//  SaoYiSao.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/23.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "SaoYiSao.h"

@interface SaoYiSao ()<BaseViewControllerDelegate>

@end

@implementation SaoYiSao

-(void)dismissViewController:(BaseViewController *)baseVc
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.baseVcDelegate = self;
    [self setTitlelable:@"扫一扫"];
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(0, 44, self.view.width, self.view.height - 44);
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

//
//  IntrodutionVc.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/21.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "IntrodutionVc.h"

@interface IntrodutionVc ()<BaseViewControllerDelegate>

@end

@implementation IntrodutionVc

#pragma mark - BaseViewControllerDelegate
-(void)dismissViewController:(BaseViewController *)baseVc
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.baseVcDelegate = self;
    [self setTitlelable:@"自贡博物馆简介"];
    
    UITextView *textView = [[UITextView alloc]init];
    textView.frame = CGRectMake(10, 60, self.view.frame.size.width - 20, self.view.frame.size.height - 60 - 20);
    [self.view addSubview:textView];
    textView.editable = NO;
    textView.font = [UIFont systemFontOfSize:16];
    
    textView.text = @"  自贡恐龙博物馆位于四川省自贡市的东北部，距市中心11公里。它是在世界著名的“大山铺恐龙化石群遗址”上就地兴建的一座大型遗址类博物馆，是中国继半坡遗址和秦始皇兵马俑坑之后，又一大型现场博物馆，也是我国第一座专业性恐龙博物馆，世界三大恐龙遗址博物馆之一。博物馆占地面积6.6万多平方米，馆藏化石标本几乎囊括了距今2.01-1.45亿年前侏罗纪时期所有已知恐龙种类，是世界上收藏和展示侏罗纪恐龙化石最多的地方之一。被美国《国家地理》杂志评价为“世界上最好的恐龙博物馆”。";
    
    
    // Do any additional setup after loading the view.
}
@end

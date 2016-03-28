//
//  ViewController.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/18.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "ViewController.h"
#import "ZYTabBarController.h"
#import "LeftMenu.h"
#import "SaoYiSao.h"

#define MENU_WIDTH 150.0

@interface ViewController ()<ZYTabBarControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.初始化子控制器
    // 1.1 左侧菜单
    LeftMenu *leftMenu = [[LeftMenu alloc]init];
    leftMenu.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y,MENU_WIDTH, self.view.frame.size.height);
    
    ZYLog(@"%@",NSStringFromCGRect(leftMenu.view.frame));
    [self.view addSubview:leftMenu.view];
    [self addChildViewController:leftMenu];

    // 1.2 中间内容
    ZYTabBarController *tabVc = [[ZYTabBarController alloc]init];
    tabVc.mydelegate = self;
    tabVc.view.frame = self.view.frame;
    [self.view addSubview:tabVc.view];
    [self addChildViewController:tabVc];
    
    // 2.监听中间页面的滑动
    [tabVc.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragTabView:)]];

    
}

- (void)dragTabView:(UIPanGestureRecognizer *)panGestureRecognizer
{
    CGPoint point = [panGestureRecognizer translationInView:panGestureRecognizer.view];
    
    if(panGestureRecognizer.state ==UIGestureRecognizerStateCancelled || panGestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        // 结束拖拽
        if(panGestureRecognizer.view.frame.origin.x > MENU_WIDTH *0.5)
        {
            // 拖拽距离大于菜单宽度的一半
            [UIView animateWithDuration:0.2 animations:^{
                panGestureRecognizer.view.transform = CGAffineTransformMakeTranslation(MENU_WIDTH, 0);
            }];
        }
        else
        {
            // 拖拽距离小于等于菜单宽度的一半
            [UIView animateWithDuration:0.2 animations:^{
                panGestureRecognizer.view.transform = CGAffineTransformIdentity;
            }];
        }
    }
    else
    {
        // 正在拖拽
        panGestureRecognizer.view.transform = CGAffineTransformTranslate(panGestureRecognizer.view.transform, point.x, 0);
        [panGestureRecognizer setTranslation:CGPointZero inView:panGestureRecognizer.view];
        
        if(panGestureRecognizer.view.frame.origin.x > MENU_WIDTH)
        {
            // 禁止拖拽超菜单宽度
            panGestureRecognizer.view.transform = CGAffineTransformMakeTranslation(MENU_WIDTH, 0);
        }
        else if(panGestureRecognizer.view.frame.origin.x < 0)
        {
            // 禁止往左拖拽
            panGestureRecognizer.view.transform = CGAffineTransformIdentity;
        
        }
    }
    

}

#pragma mark - ZYTabBarControllerDelegate
- (void)menuClicked:(ZYTabBarController *)tabVc
{
    if(tabVc.view.frame.origin.x == 0)
    {
        [UIView animateWithDuration:0.2 animations:^{
            tabVc.view.transform = CGAffineTransformMakeTranslation(MENU_WIDTH, 0);
        }];
    }
    else
    {
        [UIView animateWithDuration:0.2 animations:^{
            tabVc.view.transform = CGAffineTransformMakeTranslation(0, 0);
        }];
    }
}

- (void)scanClicked:(ZYTabBarController *)tabVc
{

    SaoYiSao *saoyisao = [[SaoYiSao alloc]init];
    saoyisao.modalPresentationStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:saoyisao animated:YES completion:^{
        
    }];

}
@end

//
//  TicketsService.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/21.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "TicketsService.h"

@interface TicketsService ()<BaseViewControllerDelegate,UIWebViewDelegate>
{
    UIActivityIndicatorView *activityIndicatorView;
}

@end

@implementation TicketsService

- (void)viewDidLoad {
    [super viewDidLoad];
    self.baseVcDelegate = self;
    [self setTitlelable:@"订票服务"];
    
    UIWebView *webView = [[UIWebView alloc]init];
    webView.delegate = self;
    webView.frame = CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.ly.com/scenery/BookSceneryTicket.aspx?id=7647&refid=11103301&tcbdkeyid=8295314045"]];
    [webView loadRequest:request];
    [self.view addSubview:webView];
   
    activityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame:webView.frame];
    activityIndicatorView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];

    
    // Do any additional setup after loading the view.
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityIndicatorView stopAnimating];
    [activityIndicatorView removeFromSuperview];

}

#pragma mark - BaseViewControllerDelegate
-(void)dismissViewController:(BaseViewController *)baseVc
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}
@end

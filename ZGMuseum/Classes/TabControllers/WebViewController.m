//
//  WebViewController.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/23.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<BaseViewControllerDelegate,UIWebViewDelegate>

@property (nonatomic,strong) UIActivityIndicatorView *activityIndicatorView;
@end

@implementation WebViewController

- (void)dismissViewController:(BaseViewController *)baseVc
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitlelable:_titleName];
    self.baseVcDelegate = self;
    UIWebView *webView = [[UIWebView alloc]init];
    webView.frame = CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44);
    webView.scrollView.scrollEnabled = NO;
    webView.delegate = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_urlstr]];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
    // 等待指示器
    _activityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_activityIndicatorView];
    [_activityIndicatorView startAnimating];

    // Do any additional setup after loading the view.
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_activityIndicatorView stopAnimating];

}
@end

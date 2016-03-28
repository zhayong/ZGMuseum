//
//  BTScrollView.m
//  BTMuseumPlatform
//
//  Created by songxiaobo on 15/2/6.
//  Copyright (c) 2015年 zhayong. All rights reserved.
//

#import "BTScrollView.h"

@interface BTScrollView()<UIScrollViewDelegate>

/**
 *  滚动页面
 */
@property(nonatomic,strong) BTScrollView *scrollView;
/**
 *  滚动页面的图片数组
 */
@property (nonatomic,strong) NSMutableArray *pictureArr;
/**
 *   滚动的页码
 */
@property (nonatomic,assign) NSInteger pages;
/**
 *  定时器
 */
@property (nonatomic,strong) NSTimer *timer;
/**
 *  滚动控制器
 */
@property (nonatomic,strong) UIPageControl *pageControl;

@end

@implementation BTScrollView


+(instancetype)scrollViewWithFrame:(CGRect)frame pictureArray:(NSArray *)pictureArray introductionArray:(NSArray *)introductionArray
{
    BTScrollView *scrollview = [[BTScrollView alloc]init];
    scrollview.frame = frame;
    scrollview.backgroundColor = [UIColor whiteColor];
    scrollview.pages = [pictureArray count];
    CGFloat width = scrollview.frame.size.width;
    CGFloat height = scrollview.frame.size.height;
    
    scrollview.contentSize = CGSizeMake(width*scrollview.pages, height);
    scrollview.pagingEnabled = YES;
    scrollview.delegate = scrollview;
    
    for(int i=0;i<scrollview.pages;i++)
    {
        // 1.添加图片
        UIImageView *imageView =[[UIImageView alloc]init];
        imageView.frame = CGRectMake(i*width, 0,width,height);
//        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",BT_IMAGE,[pictureArray objectAtIndex:i]]];
//        [imageView sd_setImageWithURL:url placeholderImage:nil];
        imageView.image = [UIImage imageNamed:pictureArray[i]];
        [scrollview addSubview:imageView];
        
        // 2.添加文字
        UILabel *lab = [[UILabel alloc]init];
        lab.backgroundColor = [UIColor grayColor];
        lab.frame = CGRectMake(i*width,height - 44,width,44);
        lab.text = introductionArray[i];
        lab.textAlignment = NSTextAlignmentRight;
        [scrollview addSubview:lab];
        
    }
    //设置轮播图的小圆点
    UIPageControl * pageControl = [[UIPageControl alloc] init];
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    CGFloat centerY = CGRectGetMaxY(scrollview.frame);
    CGFloat centerX = CGRectGetMaxX(scrollview.frame)/2;
    pageControl.center = CGPointMake(centerX, centerY-18);
    pageControl.numberOfPages = pictureArray.count;
    //[scrollview addSubview:pageControl];
    
    scrollview.showsHorizontalScrollIndicator = NO;
    
    scrollview.scrollView = scrollview;
    scrollview.scrollView.delegate = scrollview;
    scrollview.pageControl = pageControl;
    [scrollview addTimer];
    
    BTScrollView *view = [[BTScrollView alloc]init];
    view.frame = scrollview.frame;
    [view addSubview:scrollview];
    [view addSubview:pageControl];
    return view;
    
}

//设置pageControl的跳动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x/265;
    self.pageControl.currentPage = page;
}

//设置定时器
- (void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)nextImage
{
    CGFloat scrollX = self.scrollView.frame.size.width;
    int page = self.scrollView.contentOffset.x/scrollX + 1;
    if (page == self.pages) {
        page = 0;
    }
    CGPoint offset = CGPointMake(page * scrollX, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}
- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}

@end

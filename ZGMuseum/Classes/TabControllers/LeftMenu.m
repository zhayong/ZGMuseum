//
//  LeftMenu.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/18.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#define MENU_WIDTH 150.0

#import "LeftMenu.h"

#import "IntrodutionVc.h"
#import "TicketsService.h"
#import "MapNavigation.h"
#import "TransportationGuide.h"
#import "EntertainmentCenter.h"

@interface LeftMenu ()



// 左侧菜单属性数组
@property(nonatomic,strong) NSArray *menuArray;

//
@property(nonatomic,strong) NSArray *menuControllers;

@end

@implementation LeftMenu

//在ios8上 [TableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];不起作用

//经过测试加入下面方法 在ios7 8上都可以正常工作

-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.scrollEnabled = NO;
    self.menuArray = [NSArray arrayWithObjects:@"博物馆简介",@"订票服务",@"地图导航",@"交通指南",@"娱乐中心",nil];
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.separatorInset =  UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.backgroundColor = [UIColor colorWithCGColor:ZGColor(34, 34, 34).CGColor];
    
    // 设置菜单表头
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,MENU_WIDTH, 80)];
    lab.font = [UIFont boldSystemFontOfSize:16];
    lab.text = @"游客中心";
    lab.textAlignment = NSTextAlignmentCenter;
    lab.textColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = lab;
    
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.menuArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.textLabel.text = self.menuArray[indexPath.row];
    ZYLog(@"%@",NSStringFromUIEdgeInsets(cell.separatorInset));
    return cell;
}

#pragma mark - delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *choiseVc;
    
    switch (indexPath.row) {
        case 0:
            {
                IntrodutionVc *introVc = [[IntrodutionVc alloc]init];
                choiseVc = introVc;
            }
            break;
            
        case 1:
            {
                TicketsService *ticketsVc = [[TicketsService alloc]init];
                choiseVc = ticketsVc;
            }
            break;
            
        case 2:
            {
                MapNavigation *mapVc = [[MapNavigation alloc]init];
                choiseVc = mapVc;
            }
            break;
        
        case 3:
            {
                TransportationGuide *transportationVc = [[TransportationGuide alloc]init];
                choiseVc = transportationVc;
            }
            case 4:
        {
        
            EntertainmentCenter *entertainmentCenter = [[EntertainmentCenter alloc]init];
            choiseVc = entertainmentCenter;
        }
            break;
            
        default:
            break;
    }
    
    choiseVc.modalTransitionStyle = UIModalPresentationPageSheet;
    
    [self presentViewController:choiseVc animated:YES completion:^{
        
    }];

}

@end

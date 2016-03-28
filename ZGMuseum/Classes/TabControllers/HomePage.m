//
//  HomePage.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/18.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "HomePage.h"
#import "BTScrollView.h"
#import "GuanCangModel.h"
#import "GuanCangModelCell.h"
#import "GuanCangDetail.h"

@interface HomePage ()

@property (strong,nonatomic) NSArray *guanCangArray;

@end

@implementation HomePage

- (NSArray *)guanCangArray
{
    if(_guanCangArray == nil)
    {
        _guanCangArray = [NSArray array];
        
        NSArray *modelArray = [GuanCangModel objectArrayWithFilename:@"guancang.plist"];
        _guanCangArray = modelArray;
    }
    return _guanCangArray;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *pictureArray = [NSArray arrayWithObjects:@"bwg",@"dt",@"dm", nil];
    NSArray *introductionArray = [NSArray arrayWithObjects:@"自贡博物馆",@"博物馆大厅",@"博物馆大门", nil];
    
    BTScrollView *scrollView = [BTScrollView scrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)  pictureArray:pictureArray introductionArray:introductionArray];
    self.tableView.tableHeaderView = scrollView;
    // Do any additional setup after loading the view.
}

#pragma mark - TableViewDataSoure

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.guanCangArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建cell
    GuanCangModelCell *cell = [GuanCangModelCell guanCangCellWithTableView:tableView];
    // 加载数据
    cell.guanCangModel = self.guanCangArray[indexPath.row];
    return cell;

}

#pragma mark - TableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GuanCangDetail *guanCangDetail = [[GuanCangDetail alloc]init];
    guanCangDetail.guanCangModel = self.guanCangArray[indexPath.row];
    [self.navigationController pushViewController:guanCangDetail animated:YES];

}


@end

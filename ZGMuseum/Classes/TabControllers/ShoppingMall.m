//
//  ShoppingMall.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/18.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "ShoppingMall.h"
#import "ShoppingMallModel.h"
#import "ShoppingMallModelCell.h"
#import "ShoppingMallDetail.h"

@interface ShoppingMall ()

@property (nonatomic,strong) NSArray *shoppingMallArray;

@end

@implementation ShoppingMall

- (NSArray *)shoppingMallArray
{
    if(_shoppingMallArray == nil)
    {
        _shoppingMallArray = [NSArray array];
        _shoppingMallArray = [ShoppingMallModel objectArrayWithFilename:@"shangping.plist"];
    }
    return _shoppingMallArray;

}

#pragma mark - TableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.shoppingMallArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //
    ShoppingMallModelCell *cell = [ShoppingMallModelCell shoppingCellWithTableView:tableView];
    cell.shoppingMallModel = self.shoppingMallArray[indexPath.row];
    
    return cell;


}

#pragma mark - dataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    ShoppingMallDetail *shoppingMallDetail = [[ShoppingMallDetail alloc]init];
    shoppingMallDetail.shoppingMallModel = _shoppingMallArray[indexPath.row];
    [self.navigationController pushViewController:shoppingMallDetail animated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
@end

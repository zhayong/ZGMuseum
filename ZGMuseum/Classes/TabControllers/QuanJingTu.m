//
//  QuanJingTu.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/18.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "QuanJingTu.h"
#import "ExhibitionModel.h"
#import "ExhibitionModelCell.h"

@interface QuanJingTu ()

@property(nonatomic,strong) NSArray *exhibitonArray;
@end

@implementation QuanJingTu

- (NSArray *)exhibitonArray
{
    if(_exhibitonArray == nil)
    {
        _exhibitonArray = [NSArray array];
        NSArray *modelArray = [ExhibitionModel objectArrayWithFilename:@"quanjingtu.plist"];
        _exhibitonArray = modelArray;
    
    }
    
    return _exhibitonArray;


}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 100;
    
}

#pragma mark - TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.exhibitonArray.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExhibitionModelCell *cell = [ExhibitionModelCell exhibitionCellWithTableView:tableView];
    cell.exhibitionModel = self.exhibitonArray[indexPath.row];
    return cell;
}

@end

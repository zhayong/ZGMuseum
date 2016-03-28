//
//  ShoppingMallModelCell.h
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/22.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShoppingMallModel;

@interface ShoppingMallModelCell : UITableViewCell

@property (strong,nonatomic) ShoppingMallModel *shoppingMallModel;

+ (instancetype)shoppingCellWithTableView:(UITableView *)tableView;

@end

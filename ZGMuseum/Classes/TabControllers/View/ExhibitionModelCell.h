//
//  ExhibitionModelCell.h
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/22.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ExhibitionModel;

@interface ExhibitionModelCell : UITableViewCell

@property (strong,nonatomic) ExhibitionModel *exhibitionModel;

+ (instancetype)exhibitionCellWithTableView:(UITableView *)tableView;

@end

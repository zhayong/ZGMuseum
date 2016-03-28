//
//  GuanCangModelCell.h
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/21.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GuanCangModel;

@interface GuanCangModelCell : UITableViewCell

@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UILabel *nameView;
@property (strong, nonatomic) UILabel *introductionView;
@property (strong, nonatomic) UIButton *collectionButton;
@property (weak,nonatomic)  GuanCangModel *guanCangModel;

+ (instancetype)guanCangCellWithTableView:(UITableView *)tableView;

@end

//
//  ShoppingMallModelCell.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/22.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "ShoppingMallModelCell.h"
#import "ShoppingMallModel.h"

@interface ShoppingMallModelCell()

@property(nonatomic,strong) UIImageView *iconView;
@property (strong,nonatomic) UILabel *nameView;
@property (strong,nonatomic) UILabel *introductionView;
@property (strong,nonatomic) UILabel *priceView;
@property (strong,nonatomic) UILabel *saleCountView;

@end

@implementation ShoppingMallModelCell

- (void)awakeFromNib {
    // Initialization code
}

+ (instancetype)shoppingCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"shoppingMallModel";
    ShoppingMallModelCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil)
    {
        cell = [[ShoppingMallModelCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    
    }
    return cell;

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if(self)
    {
        // 创建子控件
        self.iconView = [[UIImageView alloc]init];
        self.iconView.frame = CGRectMake(5, 5, 105, 105);
        [self.contentView addSubview:self.iconView];
        
        self.nameView = [[UILabel alloc]init];
        self.nameView.x = 120;
        self.nameView.y = 5;
        self.nameView.height = 24;
        self.nameView.width = SCREEN_RECT.size.width - 120 -10;
        [self.contentView addSubview:self.nameView];
        
        self.introductionView = [[UILabel alloc]init];
        self.introductionView.x = 120;
        self.introductionView.y = 36;
        self.introductionView.height = 50;
        self.introductionView.width = SCREEN_RECT.size.width - 120 -10;
        [self.contentView addSubview:self.introductionView];
        
        self.priceView = [[UILabel alloc]init];
        self.priceView.textColor = [UIColor redColor];
        self.priceView.x = 120;
        self.priceView.y = 92;
        self.priceView.height = 24;
        self.priceView.width = 94;
        [self.contentView addSubview:self.priceView];
        
        self.saleCountView = [[UILabel alloc]init];
        self.saleCountView.width = 94;
        self.saleCountView.height = 24;
        self.saleCountView.right = SCREEN_RECT.size.width - 10;
        self.saleCountView.top = self.priceView.y;
        [self.contentView addSubview:self.saleCountView];
    
    
    }

    return self;

}

- (void)setShoppingMallModel:(ShoppingMallModel *)shoppingMallModel
{
    _shoppingMallModel = shoppingMallModel;
    _iconView.image = [UIImage imageNamed:shoppingMallModel.iconName];
    _nameView.text = shoppingMallModel.name;
    _introductionView.text = shoppingMallModel.introduction;
    _priceView.text = [NSString stringWithFormat:@"￥:%@",shoppingMallModel.price];
    _saleCountView.text = [NSString stringWithFormat:@"已售 %ld",(long)shoppingMallModel.saleCount];
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

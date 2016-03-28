//
//  ExhibitionModelCell.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/22.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "ExhibitionModelCell.h"
#import "ExhibitionModel.h"

@interface ExhibitionModelCell()

@property (strong,nonatomic) UIImageView *iconView;
@property (strong,nonatomic) UILabel *exhibitonNameView;
@property (strong,nonatomic) UILabel *exhibitonIntroductionView;

@end

@implementation ExhibitionModelCell

- (void)awakeFromNib {
    // Initialization code
}

+(instancetype)exhibitionCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"exhibitionModel";
    ExhibitionModelCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil)
    {
        cell = [[ExhibitionModelCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    
    }
    return cell;

}
/**
 *  重写initWithStyle，在这里创建cell的子控件
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        // 创建子控件
        self.iconView = [[UIImageView alloc]init];
        self.iconView.frame = CGRectMake(5, 5, 120, 90);
        [self.iconView.layer setMasksToBounds:YES];
        [self.iconView.layer setCornerRadius:10];
        [self.contentView addSubview:self.iconView];
        
        self.exhibitonNameView = [[UILabel alloc]init];
        self.exhibitonNameView.left = 130;
        self.exhibitonNameView.top = 5;
        self.exhibitonNameView.height = 30;
        self.exhibitonNameView.width = SCREEN_RECT.size.width - 130 - 10;
        [self.contentView addSubview:self.exhibitonNameView];
        
//        self.exhibitonIntroductionView = [[UILabel alloc]init];
//        self.exhibitonIntroductionView.numberOfLines = 0;
//        self.exhibitonIntroductionView.left = 110;
//        self.exhibitonIntroductionView.top = 5 + self.exhibitonNameView.height + 5;
//        self.exhibitonIntroductionView.height = 50;
//        self.exhibitonIntroductionView.width = self.exhibitonNameView.width;
//        [self.contentView addSubview:self.exhibitonIntroductionView];
        
    }
    return self;

}

- (void)setExhibitionModel:(ExhibitionModel *)exhibitionModel
{
    _exhibitionModel = exhibitionModel;
    self.iconView.image = [UIImage imageNamed:exhibitionModel.imageName];
    self.exhibitonNameView.text = exhibitionModel.ExhibitionName;
    //self.exhibitonIntroductionView.text = exhibitionModel.ExhibitionIntroduction;
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

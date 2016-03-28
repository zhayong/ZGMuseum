//
//  GuanCangModelCell.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/21.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "GuanCangModelCell.h"
#import "GuanCangModel.h"

@implementation GuanCangModelCell

- (void)awakeFromNib {
    
    
    // Initialization code
}

+ (instancetype)guanCangCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"guangCangCell";
    GuanCangModelCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil)
    {
        // 从xib加载cell
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"GuanCangModelCell" owner:nil options:nil] lastObject];
        cell = [[GuanCangModelCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    
    }
    return cell;
}
/**
 *  重写initWithStyle
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if(self)
    {
        _imgView = [[UIImageView alloc]init];
        _imgView.size = CGSizeMake(75, 75);
        _imgView.top = 5;
        _imgView.left = 5;
        [self.contentView addSubview:_imgView];
        
        _collectionButton = [[UIButton alloc]init];
//        _collectionButton.size = CGSizeMake(68,30);
        _collectionButton.size = CGSizeMake(44, 44);
        _collectionButton.top = 4;
        _collectionButton.right = SCREEN_RECT.size.width - 10;
//        _collectionButton.backgroundColor = [UIColor orangeColor];
//        [_collectionButton setTitle:@"收藏" forState:UIControlStateNormal];
        
        [_collectionButton addTarget:self action:@selector(collectionButton_clicked:) forControlEvents:UIControlEventTouchUpInside];
        [_collectionButton setImage:[UIImage imageNamed:@"collect"] forState:UIControlStateNormal];
        [_collectionButton setImage:[UIImage imageNamed:@"collected"] forState:UIControlStateSelected];
        [self.contentView addSubview:_collectionButton];
        
        _nameView = [[UILabel alloc]init];
        _nameView.height = 26;
        _nameView.width = SCREEN_RECT.size.width - _imgView.frame.size.width - _collectionButton.width;
        _nameView.left = 80 + 20;
        _nameView.top = 4;
        [self.contentView addSubview:_nameView];
        
        _introductionView = [[UILabel alloc]init];
        _introductionView.numberOfLines = 0;
        _introductionView.font = [UIFont systemFontOfSize:14];
        _introductionView.width = SCREEN_RECT.size.width - _imgView.frame.size.width - 40;
        _introductionView.height =  42;
        _introductionView.left = 80 + 20;
        _introductionView.top = self.contentView.height - 4;
        [self.contentView addSubview:_introductionView];


    }
    return self;

}
- (void)setGuanCangModel:(GuanCangModel *)guanCangModel
{
    _guanCangModel = guanCangModel;
    _imgView.image = [UIImage imageNamed:guanCangModel.imageName];
    _nameView.text = guanCangModel.name;
    _introductionView.text = guanCangModel.introduction;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)collectionButton_clicked:(UIButton *)sender {
    
    if(sender.selected)
    {
        [_collectionButton setImage:[UIImage imageNamed:@"collect"] forState:UIControlStateNormal];
        sender.selected = NO;
    }
    else
    {
    
        [_collectionButton setImage:[UIImage imageNamed:@"collected"] forState:UIControlStateSelected];
        sender.selected = YES;
    
    }
}
@end

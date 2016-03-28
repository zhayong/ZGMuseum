//
//  GuanCangDetail.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/22.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "GuanCangDetail.h"
#import "GuanCangModel.h"

@interface GuanCangDetail ()

@end

@implementation GuanCangDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *rightBtn = [[UIButton alloc]init];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    [rightBtn setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(shareButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, SCREEN_RECT.size.width, 200)];
    imageView.image = [UIImage imageNamed:self.guanCangModel.imageName];
    self.tableView.tableHeaderView = imageView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)shareButtonClicked:(UIButton *)sender
{

    
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//  CGSize size = [self sizeWithString:self.guanCangModel.introduction font:[UIFont systemFontOfSize:14] maxSize:CGSizeMake(SCREEN_RECT.size.width, MAXFLOAT)];
//    return size.height;
//}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = self.guanCangModel.introduction;
    if(SCREEN_RECT.size.width == 320)
    {
        cell.textLabel.font = [UIFont systemFontOfSize:14];
    }
    if(SCREEN_RECT.size.width == 375)
    {
        cell.textLabel.font = [UIFont systemFontOfSize:16];
    }
    if(SCREEN_RECT.size.width == 414)
    {
        cell.textLabel.font = [UIFont systemFontOfSize:18];
    }
        cell.textLabel.numberOfLines = 0;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}

/**
 *  计算文本的宽高
 *
 *  @param string  需要计算的文本
 *  @param font    文本显示的字体
 *  @param maxSize 文本显示的范围
 *
 *  @return 文本占用的真实宽高
 */

- (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize
{
    
    // 如果将来计算的文字范围超出了指定范围，返回的就是指定范围
    // 如果将来计算的文字范围小于指定的范围，返回的就是真实的范围
    
    NSDictionary *attributes = @{NSFontAttributeName : font};
    CGSize size = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return size;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

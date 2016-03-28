//
//  ShoppingMallDetail.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/22.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "ShoppingMallDetail.h"
#import "ShoppingMallModel.h"
#import "WebViewController.h"

@interface ShoppingMallDetail ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableView;

}

@end

@implementation ShoppingMallDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    tableView = [[UITableView alloc]init];
    tableView.x = 0;
    tableView.y = 0;
    tableView.width = self.view.width;
    tableView.height = self.view.height - 44;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.tableFooterView = [[UIView alloc]init];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(0, 0, SCREEN_RECT.size.width, 200);
    imageView.image = [UIImage imageNamed:self.shoppingMallModel.iconName];
    tableView.tableHeaderView = imageView;
    
    UIImageView *toolBar = [[UIImageView alloc]init];
    toolBar.userInteractionEnabled = YES;
    toolBar.frame = CGRectMake(0, self.view.height - 44, self.view.width, 44);
    toolBar.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:toolBar];
    
    UIButton *buyButton = [[UIButton alloc]init];
    buyButton.frame = toolBar.bounds;
    [buyButton setTitle:@"立即购买" forState:UIControlStateNormal];
    [buyButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [buyButton addTarget:self action:@selector(buyButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [toolBar addSubview:buyButton];
    
}

- (void)buyButtonClicked:(UIButton *)sender
{
    
    WebViewController *web = [[WebViewController alloc]init];
    web.urlstr = @"https://www.alipay.com";
    web.titleName = @"支付宝";
    web.modalTransitionStyle = UIModalPresentationPageSheet;
    [self presentViewController:web animated:YES completion:^{
        
    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if(indexPath.row == 0)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"名称: %@",_shoppingMallModel.name];
    
    }
    if(indexPath.row == 1)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"价格: %@",_shoppingMallModel.price];
        
    }
    if(indexPath.row == 2)
    {
        
        cell.textLabel.text = [NSString stringWithFormat:@"详情: %@",_shoppingMallModel.introduction];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


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

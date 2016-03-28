//
//  EntertainmentCenter.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/6/3.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "EntertainmentCenter.h"
#import "WebViewController.h"

@interface EntertainmentCenter ()<UITableViewDataSource,UITableViewDelegate,BaseViewControllerDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *arr;

@end

@implementation EntertainmentCenter

- (void)dismissViewController:(BaseViewController *)baseVc
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.baseVcDelegate = self;
    [self setTitlelable:@"娱乐中心"];
    
    _tableView = [[UITableView alloc]init];
    _tableView.frame = CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _arr = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6", nil];
    
}



#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = _arr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *urlstr;
    switch (indexPath.row) {
        case 0:
        {
            urlstr = @"http://luxahoy.com/";
        
        }
            break;
           
        case 1:
        {
        
            urlstr = @"http://www.pirateslovedaisies.com/";
        }
            break;
           
        case 2:
        {
            urlstr = @"http://pasjans-online.pl/";
        
        }
            break;
            
            
        case 3:
        {
            urlstr = @"http://www.currantcat.com/convergence/";
        
        }
            break;
            
        case 4:
        {
            urlstr = @"http://www.effectgames.com/effect/games/crystalgalaxy/";
        }
            break;
            
        case 5:
        {
            urlstr = @"http://yvoschaap.com/chainrxnadvanced/";
        }
            break;
            
        default:
            break;
    }
    WebViewController *web = [[WebViewController alloc]init];
    web.urlstr = urlstr;
    web.titleName = @"娱乐中心";
    web.modalTransitionStyle = UIModalPresentationPageSheet;
    [self presentViewController:web animated:YES completion:^{
        
    }];


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

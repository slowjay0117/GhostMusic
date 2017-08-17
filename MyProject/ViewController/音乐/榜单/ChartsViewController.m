//
//  ChartsViewController.m
//  MyProject
//
//  Created by will on 2017/8/16.
//  Copyright © 2017年 will. All rights reserved.
//

#import "ChartsViewController.h"
#import "ChartsCell.h"
#import "ChartsDetailViewController.h"

@interface ChartsViewController ()

@end

@implementation ChartsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册单元格
    [self.tableView registerClass:[ChartsCell class] forCellReuseIdentifier:@"ChartsCell"];
    self.tableView.sectionFooterHeight = 4;
    self.tableView.sectionHeaderHeight = 4;
    //将tableView中的内容的底部向上移动出menu的高度
    //向上移动写正直，向下移动写负值
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
    
    UIImageView *tableFooter = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tableView_section_bg"]];
    tableFooter.frame = CGRectMake(0, 0, 0, 4);
    self.tableView.tableFooterView = tableFooter;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChartsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChartsCell" forIndexPath:indexPath];
    cell.leftImageView.image = [UIImage imageNamed:@"xingebang.jpg"];
    cell.num1Lable.text = @"演员 - 薛之谦";
    cell.num2Lable.text = @"告白的气球 - 周杰伦";
    cell.num3Lable.text = @"下完这场雨 - 后弦";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}

/** 设定分区头的图片 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tableView_section_bg"]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //去掉选中的效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //创建详情vc，并由导航推出
    ChartsDetailViewController *detailVC = [ChartsDetailViewController new];
    [self.navigationController pushViewController:detailVC animated:YES];
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

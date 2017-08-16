//
//  TopNavigationController.m
//  MyProject
//
//  Created by will on 2017/8/16.
//  Copyright © 2017年 will. All rights reserved.
//

#import "TopNavigationController.h"
#import "TopMenuViewController.h"

@interface TopNavigationController ()

@end

@implementation TopNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    TopMenuViewController *menuVC = [TopMenuViewController new];
    self.viewControllers = @[menuVC];
    
    //设置导航栏的背景图
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"themeDefault"] forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  TopMenuViewController.m
//  MyProject
//
//  Created by will on 2017/8/16.
//  Copyright © 2017年 will. All rights reserved.
//

#import "TopMenuViewController.h"
#import "MusicMenuViewController.h"
#import "RadioViewController.h"

@interface TopMenuViewController ()

@end

@implementation TopMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //左侧按钮
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"bt_home_more_normal"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"bt_home_more_press"] forState:UIControlStateHighlighted];
    leftBtn.frame = CGRectMake(0, 0, 44, 44);
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    UIBarButtonItem *fixSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixSpace.width = -15;
    self.navigationItem.leftBarButtonItems = @[fixSpace, leftItem];
    //右侧按钮
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setImage:[UIImage imageNamed:@"bt_home_search1_normal"] forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:@"bt_home_search1_press"] forState:UIControlStateHighlighted];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItems = @[fixSpace, rightItem];
}

- (instancetype)init{
    if (self = [super init]) {
        self.showOnNavigationBar = YES;
        self.menuBGColor = [UIColor clearColor];
        self.titleSizeNormal = 18.0;
        self.titleColorSelected = [UIColor whiteColor];
        self.titleColorNormal = kRGBColor(255, 255, 255, 0.7);
        self.menuViewLayoutMode = 3;
        self.selectIndex = 1;
    }
    return self;
}

#pragma mark - 配置菜单的显示数据
- (NSArray<NSString *> *)titles{
    return @[@"我的", @"音乐", @"动态"];
}
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    switch (index) {
        case 0:
        {
            UIViewController *vc1 = [UIViewController new];
            vc1.view.backgroundColor = [UIColor whiteColor];
            return vc1;
        }
        case 1:
        {
            MusicMenuViewController *vc1 = [MusicMenuViewController new];
            return vc1;
        }
        case 2:
        {
            RadioViewController *vc1 = [RadioViewController new];
            return vc1;
        }
        default:
            break;
    }
    return [UIViewController new];
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

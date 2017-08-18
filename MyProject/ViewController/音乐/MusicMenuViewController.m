//
//  MusicMenuViewController.m
//  MyProject
//
//  Created by will on 2017/8/16.
//  Copyright © 2017年 will. All rights reserved.
//

#import "MusicMenuViewController.h"
#import "ChartsViewController.h"
#import "SongListViewController.h"

@interface MusicMenuViewController ()

@end

@implementation MusicMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (instancetype)init{
    if (self = [super init]) {
        self.menuBGColor = [UIColor whiteColor];
        self.titleSizeNormal = 15;
        self.titleSizeSelected = 15;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.titleColorSelected = kRGBColor(24, 190, 254, 1);
        self.progressWidth = 36;
        self.progressHeight = 3;
        self.selectIndex = 2;
    }
    return self;
}

#pragma mark - 配置菜单的显示数据
- (NSArray<NSString *> *)titles{
    return @[@"推荐",@"歌单",@"榜单",@"K歌"];
}
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    switch (index) {
        case 0:
        {
            UIViewController *vc = [UIViewController new];
            vc.view.backgroundColor = [UIColor whiteColor];
            return vc;
        }
        case 1:
        {
            SongListViewController *vc = [SongListViewController new];
            return vc;
        }
            break;
        case 2:
        {
            ChartsViewController *vc = [ChartsViewController new];
            return vc;
        }
            break;
        case 3:
        {
            UIViewController *vc = [UIViewController new];
            vc.view.backgroundColor = [UIColor blueColor];
            return vc;
        }
            break;
            
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

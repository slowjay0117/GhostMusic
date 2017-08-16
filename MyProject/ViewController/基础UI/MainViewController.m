//
//  MainViewController.m
//  MyProject
//
//  Created by will on 2017/8/16.
//  Copyright © 2017年 will. All rights reserved.
//

#import "MainViewController.h"
#import "TopNavigationController.h"

@interface MainViewController ()

/** 上半部分的导航 */
@property (nonatomic, strong)TopNavigationController *topNavi;
/** 下面的底部视图 */
@property (nonatomic, strong) UIView *bottomView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self bottomView];
    [self topNavi];
}
#pragma mark - lazy loading
- (TopNavigationController *)topNavi{
    if (!_topNavi) {
        _topNavi = [TopNavigationController new];
        [self addChildViewController:_topNavi];
        [self.view addSubview:_topNavi.view];
        [_topNavi.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-44);
        }];
    }
    return _topNavi;
}

- (UIView *)bottomView{
    if(!_bottomView){
        _bottomView=[UIView new];
        _bottomView.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:_bottomView];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(44);
        }];
    }
    return _bottomView;
}

/** 修改状态栏为浅色 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    return 1;
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

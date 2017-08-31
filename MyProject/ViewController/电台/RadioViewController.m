//
//  RadioViewController.m
//  MyProject
//
//  Created by will on 2017/8/31.
//  Copyright © 2017年 will. All rights reserved.
//

#import "RadioViewController.h"
#import "RadioCell.h"
#import "RadioCategoryCell.h"
#import "RadioLayout.h"
#import "SceneModel.h"

@interface RadioViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *grayView;

/** 为表格提供数据源的数组 */
@property (nonatomic, strong) NSArray<NSString *> *allRadioCategoryModel;
@end

@implementation RadioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
    [self grayView];
    
}

#pragma mark - lazy loading
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectNull style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.mas_equalTo(0);
            make.top.mas_equalTo(10);
            make.width.mas_equalTo(91);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        /** 去掉分割线 */
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
        /** 注册单元格 */
        [_tableView registerClass:[RadioCategoryCell class] forCellReuseIdentifier:@"RadioCategoryCell"];
    }
    return _tableView;
}

- (UIView *)grayView{
    if(!_grayView){
        _grayView = [UIView new];
        _grayView.backgroundColor = kRGBColor(210, 210, 210, 1.0);
        [self.view addSubview:_grayView];
        [_grayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.tableView.mas_right);
            make.width.mas_equalTo(1);
            make.top.mas_equalTo(15);
            make.bottom.mas_equalTo(0);
        }];
    }
    return _grayView;
}

- (NSArray<NSString *> *)allRadioCategoryModel{
    if (!_allRadioCategoryModel) {
        _allRadioCategoryModel = @[@"场景",@"主题",@"天气",@"心情",@"语言",@"年代",@"曲风"];
    }
    return _allRadioCategoryModel;
}

#pragma mark - UITableViewDataSource & Delegate 协议
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.allRadioCategoryModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RadioCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RadioCategoryCell" forIndexPath:indexPath];
    //改变cell被选中时的背景颜色
    cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor whiteColor];
    cell.titleLabel.text = self.allRadioCategoryModel[indexPath.row];
    return cell;
}

@end

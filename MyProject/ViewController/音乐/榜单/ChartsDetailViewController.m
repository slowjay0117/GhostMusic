//
//  ChartsDetailViewController.m
//  MyProject
//
//  Created by will on 2017/8/17.
//  Copyright © 2017年 will. All rights reserved.
//

#import "ChartsDetailViewController.h"
#import "ChartsDetailCell.h"

@interface ChartsDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

/** 背景图 */
@property (nonatomic, strong) UIImageView *backgroundView;
/** 表格视图 */
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ChartsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //先调用背景图的懒加载，保证在表格的下面
    [self backgroundView];
    [self tableView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.backgroundView.image = [UIImage imageNamed:@"xingebang640.jpg"];
}

#pragma mark - lazy loading
- (UIImageView *)backgroundView{
    if (!_backgroundView) {
        _backgroundView = [UIImageView new];
        [self.view addSubview:_backgroundView];
        [_backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(_backgroundView.mas_width);
        }];
    }
    return _backgroundView;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectNull style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[ChartsDetailCell class] forCellReuseIdentifier:@"ChartsDetailCell"];
    }
    return _tableView;
}

#pragma mark - 表视图代理的方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ChartsDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChartsDetailCell" forIndexPath:indexPath];
    
    cell.rankLable.text = [NSString stringWithFormat:@"%02ld", indexPath.row+1];
    //将cell中的rankLabel的字体样式调整为灰色，再根据位置不同，选择性的更改颜色
    //将cell中不通用的样式先清掉
    cell.rankLable.textColor = [UIColor lightGrayColor];
    if (indexPath.row == 0) {
        cell.rankLable.textColor = kRGBColor(237, 0, 6, 1.0);
    }
    if (indexPath.row == 1) {
        cell.rankLable.textColor = kRGBColor(235, 131, 9, 1.0);
    }
    if (indexPath.row == 2) {
        cell.rankLable.textColor = kRGBColor(239, 205, 9, 1.0);
    }
    cell.titleLable.text = @"July";
    cell.authorLable.text = @"吴亦凡";
    /**
     *  @author will, 17-08-17 14:08:51
     *
     *  将网络数据状态和定下的标准进行对比
     *  如果相等，则代表显示，不相等则代表不显示MTV,SQ,King
     */
    int isSQ = 1;
    if (isSQ == 1) {//出不出现其实就是设置宽度是0还是15
        //会出现SQ
        [self updateConstraintsWithImageView:cell.sqImageView width:15];
        cell.sqImageView.image = [UIImage imageNamed:@"ic_playlist_sq"];
    }else{
        //不会出现SQ
        [self updateConstraintsWithImageView:cell.sqImageView width:0];
    }
    int isKing = 1;
    if (isKing == 1) {
        [self updateConstraintsWithImageView:cell.kingImageView width:15];
        cell.kingImageView.image = [UIImage imageNamed:@"ic_playlist_king"];
    }else{
        [self updateConstraintsWithImageView:cell.kingImageView width:0];
    }
    int isMTV = 1;
    if (isMTV == 1) {
        [self updateConstraintsWithImageView:cell.mtvImageView width:15];
        cell.mtvImageView.image = [UIImage imageNamed:@"ic_playlist_mtv"];
    }else{
        [self updateConstraintsWithImageView:cell.mtvImageView width:0];
    }
    
    return cell;
}
/** 让单元格根据添加的内容约束，自动计算合适的高度，此方法，用于内容高度不定的情况 */
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

#pragma mark - 单独定义的方法
- (void)updateConstraintsWithImageView:(UIImageView *)imageView width:(NSInteger)width{
    [imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width);
    }];
}


@end

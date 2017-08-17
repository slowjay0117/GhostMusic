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
/** 表头视图 */
@property (nonatomic, strong) UIView *headerView;
/** 返回按钮 */
@property (nonatomic, strong) UIButton *backButton;
/** 顶部的渐变蓝色视图 */
@property (nonatomic, strong) UIView *topBlueView;
/** 顶部蓝色视图中的标签 */
@property (nonatomic, strong) UILabel *topBlueLabel;
@end

@implementation ChartsDetailViewController

#pragma mark - view的生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    //先调用背景图的懒加载，保证在表格的下面
    [self backgroundView];
    [self tableView];
    [self topBlueView];
    [self backButton];
    
    self.view.backgroundColor = [UIColor whiteColor];
    /** 关闭系统自动移动滚动视图内容的这个功能 */
    /**
     *  @author will, 17-08-17 15:08:35
     *
     *  为什么系统有自动移动滚动视图的内容呢？
     *  一旦有导航栏时，为了防止滚动视图的内容被导航栏盖住
     *  系统会自动将滚动视图的内容向下移动64个点，错开导航栏
     *  解决此问题的方案有两种，一是手动修改滚动视图的
     *  contentInse，向上移动64个点
     *  一种是关闭系统的这个功能
     */
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.backgroundView.image = [UIImage imageNamed:@"xingebang640.jpg"];
    self.tableView.tableHeaderView = self.headerView;
    self.topBlueLabel.text = @"新歌榜";
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //隐藏导航栏
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
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
- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [UIView new];
        _headerView.frame = CGRectMake(0, 0, 0, 250);
    }
    return _headerView;
}
- (UIButton *)backButton{
    if (!_backButton) {
        _backButton = [UIButton new];
        [self.view addSubview:_backButton];
        [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(28);
            make.left.mas_equalTo(15);
        }];
        [_backButton setBackgroundImage:[UIImage imageNamed:@"ic_recommend_back_normal"] forState:UIControlStateNormal];
        [_backButton setBackgroundImage:[UIImage imageNamed:@"ic_recommend_back_press"] forState:UIControlStateHighlighted];
        [_backButton bk_addEventHandler:^(id sender) {
            [self.navigationController popViewControllerAnimated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}
- (UIView *)topBlueView{
    if (!_topBlueView) {
        _topBlueView = [UIView new];
        [self.view addSubview:_topBlueView];
        _topBlueView.backgroundColor = kRGBColor(88, 179, 252, 1.0);
        _topBlueView.alpha = 0;
        [_topBlueView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(64);
        }];
        /** 创建蓝色视图内部的标签 */
        _topBlueLabel = [UILabel new];
        _topBlueLabel.font = [UIFont systemFontOfSize:18];
        _topBlueLabel.textColor = [UIColor whiteColor];
        [_topBlueView addSubview:_topBlueLabel];
        [_topBlueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(30);
        }];
    }
    return _topBlueView;
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
/** 监视tableView */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //DDLogVerbose(@"%f",scrollView.contentOffset.y);
    //0.不管拉没拉动表视图，只要表的偏移量时负值，保持背景图的顶部距离为0
    if (scrollView.contentOffset.y < 0) {
        [_backgroundView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
        }];
    }
    //1.如果向下拉动，偏移量y为负值到-110时，开始修改背景图的顶部约束，而且要保证表格的偏移量和背景图的移动距离相同，才能有同时移动，绑在一起的感觉
    if (scrollView.contentOffset.y < -110) {
        [_backgroundView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(-scrollView.contentOffset.y-110);
        }];
    }
    //2.只要表格向上移动，则背景图立即保持与表格的移动偏移量一致
    if (scrollView.contentOffset.y > 0) {
        [_backgroundView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(-scrollView.contentOffset.y);
        }];
    }
    //3.当表格向上滚动到某个距离时，让顶部的蓝色视图，从透明变成不透明
    //表头高250，滚动到距离view64的位置
    if (scrollView.contentOffset.y > 186) {
        //只要将要改变的数据的目标值放在这个方法内，则系统就会自动为这个变化过程添加动画效果
        [UIView animateWithDuration:0.5 animations:^{
            self.topBlueView.alpha = 1;
        }];
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            self.topBlueView.alpha = 0;
        }];
    }
}

#pragma mark - 单独定义的方法
- (void)updateConstraintsWithImageView:(UIImageView *)imageView width:(NSInteger)width{
    [imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width);
    }];
}


@end

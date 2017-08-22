//
//  SongListViewController.m
//  MyProject
//
//  Created by will on 2017/8/18.
//  Copyright © 2017年 will. All rights reserved.
//

#import "SongListViewController.h"
#import "SongListCell.h"
#import "SongListLayout.h"

@interface SongListViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
/** 顶部盖在集合视图上面的与分区头内容大小一致的一个视图 */
@property (nonatomic, strong) UIView *topView;
/** 分区头视图中，用于容纳各个子视图的容器view */
@property (nonatomic, strong) UIView *sectionHeaderContainerView;

@property (nonatomic, strong) UIButton *latestButton;
@property (nonatomic, strong) UIButton *hotestButton;
@end

@implementation SongListViewController
#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self collectionView];
    [self topView];
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
}

#pragma mark - lazy loading
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectNull collectionViewLayout:[SongListLayout new]];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[SongListCell class] forCellWithReuseIdentifier:@"SongListCell"];
        //注册可重复使用的分区头视图
        //第一个参数：注册的视图种类，系统就是依据这个类型负责自动创建该种类型的实例
        //第二个参数：注册视图摆放的位置，两种选择，如果是Header，则放在分区上面，如果是Footer，则放在分区的下面
        //第三个参数：注册的该种款式的视图的标识
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerReuse"];
    }
    return _collectionView;
}

- (UIView *)topView{
    if (!_topView) {
        //顶部默认隐藏的视图
        _topView = [UIView new];
        _topView.backgroundColor = [UIColor whiteColor];
        _topView.alpha = 0.8;
        [self.view addSubview:_topView];
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(40);
        }];
        //添加标签
        UILabel *label = [UILabel new];
        label.text = @"全部歌单";
        label.font = [UIFont systemFontOfSize:12];
        [_topView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(20);
        }];
        //添加向下箭头的按钮
        UIButton *operateButton = [UIButton new];
        [_topView addSubview:operateButton];
        [operateButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(label.mas_right).mas_equalTo(10);
            make.size.mas_equalTo(25);
        }];
        [operateButton setBackgroundImage:[UIImage imageNamed:@"bt_playlist_choice_normale"] forState:UIControlStateNormal];
        [operateButton setBackgroundImage:[UIImage imageNamed:@"bt_playlist_choice_press"] forState:UIControlStateHighlighted];
        //最新按钮
        _latestButton = [UIButton new];
        [_latestButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_latestButton setTitleColor:kRGBColor(29, 194, 255, 1.0) forState:UIControlStateSelected];
        [_latestButton setTitle:@"最新" forState:UIControlStateNormal];
        _latestButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_topView addSubview:_latestButton];
        [_latestButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 25));
            make.right.mas_equalTo(-20);
            make.centerY.mas_equalTo(0);
        }];
//        [_latestButton bk_addEventHandler:^(id sender) {
//            _latestButton.selected = YES;
//            _hotestButton.selected = NO;
//        } forControlEvents:UIControlEventTouchUpInside];
        //中间的灰色短竖线
        UIView *lineView = [UIView new];
        [_topView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_latestButton.mas_left).mas_equalTo(-5);
            make.size.mas_equalTo(CGSizeMake(1, 18));
            make.centerY.mas_equalTo(0);
        }];
        lineView.backgroundColor = [UIColor lightGrayColor];
        //最热按钮
        _hotestButton = [UIButton new];
        [_hotestButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_hotestButton setTitleColor:kRGBColor(29, 194, 255, 1.0) forState:UIControlStateSelected];
        [_hotestButton setTitle:@"最热" forState:UIControlStateNormal];
        _hotestButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_topView addSubview:_hotestButton];
        [_hotestButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 25));
            make.right.mas_equalTo(lineView.mas_left).mas_equalTo(-5);
            make.centerY.mas_equalTo(0);
        }];
        _hotestButton.selected = YES;
//        [_hotestButton bk_addEventHandler:^(id sender) {
//            _hotestButton.selected = YES;
//            _latestButton.selected = NO;
//        } forControlEvents:UIControlEventTouchUpInside];
        //设置topView为隐藏
        _topView.hidden = YES;
    }
    return _topView;
}

- (UIView *)sectionHeaderContainerView{
    if (!_sectionHeaderContainerView) {
        _sectionHeaderContainerView = [UIView new];
        //添加标签
        UILabel *label = [UILabel new];
        label.text = @"全部歌单";
        label.font = [UIFont systemFontOfSize:12];
        [_sectionHeaderContainerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(20);
        }];
        //添加向下箭头的按钮
        UIButton *operateButton = [UIButton new];
        [_sectionHeaderContainerView addSubview:operateButton];
        [operateButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(label.mas_right).mas_equalTo(10);
            make.size.mas_equalTo(25);
        }];
        [operateButton setBackgroundImage:[UIImage imageNamed:@"bt_playlist_choice_normale"] forState:UIControlStateNormal];
        [operateButton setBackgroundImage:[UIImage imageNamed:@"bt_playlist_choice_press"] forState:UIControlStateHighlighted];
        //最新按钮
        _latestButton = [UIButton new];
        [_latestButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_latestButton setTitleColor:kRGBColor(29, 194, 255, 1.0) forState:UIControlStateSelected];
        [_latestButton setTitle:@"最新" forState:UIControlStateNormal];
        _latestButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_sectionHeaderContainerView addSubview:_latestButton];
        [_latestButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 25));
            make.right.mas_equalTo(-20);
            make.centerY.mas_equalTo(0);
        }];
        [_latestButton bk_addEventHandler:^(id sender) {
            _latestButton.selected = YES;
            _hotestButton.selected = NO;
        } forControlEvents:UIControlEventTouchUpInside];
        //中间的灰色短竖线
        UIView *lineView = [UIView new];
        [_sectionHeaderContainerView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_latestButton.mas_left).mas_equalTo(-5);
            make.size.mas_equalTo(CGSizeMake(1, 18));
            make.centerY.mas_equalTo(0);
        }];
        lineView.backgroundColor = [UIColor lightGrayColor];
        _hotestButton = [UIButton new];
        [_hotestButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_hotestButton setTitleColor:kRGBColor(29, 194, 255, 1.0) forState:UIControlStateSelected];
        [_hotestButton setTitle:@"最热" forState:UIControlStateNormal];
        _hotestButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_sectionHeaderContainerView addSubview:_hotestButton];
        [_hotestButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 25));
            make.right.mas_equalTo(lineView.mas_left).mas_equalTo(-5);
            make.centerY.mas_equalTo(0);
        }];
        _hotestButton.selected = YES;
        [_hotestButton bk_addEventHandler:^(id sender) {
            _hotestButton.selected = YES;
            _latestButton.selected = NO;
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _sectionHeaderContainerView;
}

#pragma mark - 集合视图协议的方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 45;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SongListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SongListCell" forIndexPath:indexPath];
    NSString *fileName = [NSString stringWithFormat:@"gedan%ld.jpg", indexPath.item%11];
    cell.posterImageView.image = [UIImage imageNamed:fileName];
    cell.titleLabel.text = @"现在就是我想你的时候";
    cell.crearorLabel.text = @"By 限量版不着调的........";
    
    //1.创建一个附件，附件内容就是图片
    NSTextAttachment *audio = [NSTextAttachment new];
    audio.image = [UIImage imageNamed:@"ic_recommend_audition"];
    audio.bounds = CGRectMake(0, 0, 10, 10);
    //2.将附件转换为NSAttributedString类型
    NSAttributedString *audioString = [NSAttributedString attributedStringWithAttachment:audio];
    //3.将附件插入到指定的带有属性的字符串的某个位置上
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:@" 4872"];
    [string insertAttributedString:audioString atIndex:0];
    //4.为带有属性的字符串添加属性设置
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, string.length)];
    //[string addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(3, 1)];
    //[string addAttribute:NSKernAttributeName value:@8 range:NSMakeRange(0, string.length)];
    //5.将带有属性的字符串赋给负责显示文本的标签、按钮等控件
    cell.listenNumLabel.attributedText = string;
    return cell;
}

/**
 *  @author will, 17-08-18 17:08:16
 *
 *  该方法负责生产分区头或脚视图对象，作用同生成单元格的那个第三问
 *  只要屏幕中需要显示分区头或脚了，集合视图就会自动调用该方法
 *  先dequeue，然后又回收的则直接返回，没有回收了的，则自动一句注册的类型创建实例返回
 */
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    //通过判断kind参数，知道系统本次调用方法是想生成头还是脚
    if (kind == UICollectionElementKindSectionHeader) {
       UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerReuse" forIndexPath:indexPath];
        if (headerView.subviews.count == 0) {
            [headerView addSubview:self.sectionHeaderContainerView];
            [self.sectionHeaderContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
            }];
        }
        DDLogVerbose(@"%ld", headerView.subviews.count);
        return headerView;
    }
    return nil;
}

/** 监测滚动视图 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y > 0) {
        self.topView.hidden = NO;
        //分区头视图设置为隐藏
        self.sectionHeaderContainerView.hidden = YES;
    }else{
        self.topView.hidden = YES;
        //分区头视图设置为显示
        self.sectionHeaderContainerView.hidden = NO;
    }
}
@end

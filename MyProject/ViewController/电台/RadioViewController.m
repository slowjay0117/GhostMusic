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

@interface RadioViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *grayView;
@property (nonatomic, strong) UICollectionView *collectionView;

/** 为表格提供数据源的数组 */
@property (nonatomic, strong) NSArray<NSString *> *allRadioCategoryModel;
/** 准备一个数组，存储所有的场景信息 */
@property (nonatomic, strong) NSArray<SceneModel *> *allScenesModel;
/** 为集合视图提供数据源的数组，只要选中的行发生变化，就从all中挑选一部分数据加载到这个数组中，该数组发生变化以后，就让结婚reloadData，刷新界面显示 */
@property (nonatomic, strong) NSArray<SceneModel *> *selectedSceneModel;

@end

@implementation RadioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
    [self grayView];
    [self collectionView];
    //设置表格的第一行处于被选中的状态
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    //根据当前选中的行号，挑选一部分数据放到selectedSceneModel中
    //构建一个集合存储要挑选的对象的下标
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(5, 6)];
    //从all数组中，把指定坐标的对象们返回
    self.selectedSceneModel = [self.allScenesModel objectsAtIndexes:indexSet];
    [self.collectionView reloadData];
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
    
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

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectNull collectionViewLayout:[RadioLayout new]];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.grayView.mas_right);
            make.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(10);
        }];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.alwaysBounceVertical = YES;
        /** 注册cell */
        [_collectionView registerClass:[RadioCell class] forCellWithReuseIdentifier:@"RadioCell"];
    }
    return _collectionView;
}

- (NSArray<NSString *> *)allRadioCategoryModel{
    if (!_allRadioCategoryModel) {
        _allRadioCategoryModel = @[@"场景",@"主题",@"天气",@"心情",@"语言",@"年代",@"曲风"];
    }
    return _allRadioCategoryModel;
}

- (NSArray<SceneModel *> *)allScenesModel{
    if (!_allScenesModel) {
        _allScenesModel = [SceneModel demoData];
    }
    return _allScenesModel;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(indexPath.row+5, indexPath.row+6)];
    //从all数组中，把指定坐标的对象们返回
    self.selectedSceneModel = [self.allScenesModel objectsAtIndexes:indexSet];
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDelegate & DataSource 协议
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.selectedSceneModel.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RadioCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RadioCell" forIndexPath:indexPath];
    /** 从数据源数组中取出一个场景模型对象，显示image和name */
    SceneModel *model = self.selectedSceneModel[indexPath.item];
    /** 将图片按照图片视图的渲染颜色进行渲染 */
    /** 指定图片按照Template模板的样子进行渲染 */
    /** 模板从哪来？就是显示图片的 图片框iconImageView */
    UIImage *iconImage = [[UIImage imageNamed:model.image] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    cell.iconImageView.image = iconImage;
    cell.sceneNameLabel.text = model.name;
    
    return cell;
}

@end

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
@end

@implementation SongListViewController
#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self collectionView];
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
    }
    return _collectionView;
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
    cell.listenNumLabel.text = @"2345";
    return cell;
}
@end

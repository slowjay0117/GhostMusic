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
@end

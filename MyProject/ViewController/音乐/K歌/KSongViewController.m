//
//  KSongViewController.m
//  MyProject
//
//  Created by will on 2017/8/21.
//  Copyright © 2017年 will. All rights reserved.
//

#import "KSongViewController.h"
#import "TopAdCell.h"
#import "SingNumberCell.h"

@interface KSongViewController ()<UICollectionViewDelegateFlowLayout>
@end

@implementation KSongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /** 保证集合视图一定能够竖直滚动 */
    self.collectionView.alwaysBounceVertical = YES;
    
    //注册四款item的样式，已经一款分区头的样式
    [self.collectionView registerNib:[UINib nibWithNibName:@"TopAdCell" bundle:nil] forCellWithReuseIdentifier:@"TopAdCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MyKSong" bundle:nil] forCellWithReuseIdentifier:@"MyKSong"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"KSongCategory" bundle:nil] forCellWithReuseIdentifier:@"KSongCategory"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"SingNumberCell" bundle:nil] forCellWithReuseIdentifier:@"SingNumberCell"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"KSongSectionHeader" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"KSongSectionHeader"];
    //注册脚视图
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"SectionFooter"];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
}

#pragma mark <UICollectionViewDataSource>
/** 1.多少个分区 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}
/** 2.每个分区多少项 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 2) {
        return 6;
    }
    if (section == 3) {
        return 25;//假设有25条数据
    }
    return 1;
}
/** 3.每个项什么样 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        TopAdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TopAdCell" forIndexPath:indexPath];
        cell.adImageView.image = [UIImage imageNamed:@"ktv_activity.jpg"];
        return cell;
    }
    if (indexPath.section == 1) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyKSong" forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.section == 2) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"KSongCategory" forIndexPath:indexPath];
        UIImageView *iv = (UIImageView *)[cell viewWithTag:100];
        NSArray *imageNames = @[@"img_k_ktv",@"img_k_chinese",@"img_k_occident",@"img_k_man",@"img_k_woman",@"img_k_band"];
        NSArray *categoryNames = @[@"KTV热歌榜",@"华语金曲",@"欧美经典",@"男歌手",@"女歌手",@"乐队组合"];
        iv.image = [UIImage imageNamed:imageNames[indexPath.item]];
        UILabel *lb = (UILabel *)[cell viewWithTag:200];
        lb.text = categoryNames[indexPath.item];
        lb.font = [UIFont systemFontOfSize:14];
        return cell;
    }
    if (indexPath.section ==3) {
        SingNumberCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SingNumberCell" forIndexPath:indexPath];
        cell.singerImageView.image = [UIImage imageNamed:@"singnow1.jpg"];
        cell.titleLabel.text = @"布拉格广场 - 蔡依林";
        cell.numberLabel.text = @"253678唱过";
        return cell;
    }
    return nil;
    
}
/** 4.每个分区头或脚什么样 */
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 3) {
        //创建头视图
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"KSongSectionHeader" forIndexPath:indexPath];
        //返回
        return header;
    }
    UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"SectionFooter" forIndexPath:indexPath];
    footer.backgroundColor = kRGBColor(245, 245, 245, 1.0);
    return footer;
}

#pragma mark - UICollectionViewDelegateFlowLayout 协议
/** 5.每个项的尺寸 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            // 375 / 174 = kWindowW / ???
            CGFloat height = kWindowW * 174 / 375;
            return CGSizeMake(kWindowW, height);
        }
        case 1:
        {
            return CGSizeMake(kWindowW, 60);
        }
        case 2:
        {
            CGFloat width = (kWindowW - 30*2 - 20*2) / 3;
            return CGSizeMake(width, width+30);
        }
        case 3:
            return CGSizeMake(kWindowW, 60);
        default:
            break;
    }
    return CGSizeZero;
}
/** 6.每个分区内边距是多少 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 2) {
        return UIEdgeInsetsMake(20, 30, 20, 30);
    }
    return UIEdgeInsetsZero;
}
/** 7.最小行间距 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 2) {
        return 30;
    }
    return 0;
}
/** 8.最小项间距 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 2) {
        return 20;
    }
    return 0;
}
/** 9.头视图的尺寸 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 3) {
        return CGSizeMake(0, 60);
    }
    return CGSizeZero;
}
/** 10.脚视图的尺寸 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 3) {
        return CGSizeZero;
    }
    return CGSizeMake(0, 5);
}

@end

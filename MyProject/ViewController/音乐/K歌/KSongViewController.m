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
    //注册四款item的样式，已经一款分区头的样式
    [self.collectionView registerNib:[UINib nibWithNibName:@"TopAdCell" bundle:nil] forCellWithReuseIdentifier:@"TopAdCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MyKSong" bundle:nil] forCellWithReuseIdentifier:@"MyKSong"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"KSongCategory" bundle:nil] forCellWithReuseIdentifier:@"KSongCategory"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"SingNumberCell" bundle:nil] forCellWithReuseIdentifier:@"SingNumberCell"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"KSongSectionHeader" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"KSongSectionHeader"];
    //注册脚视图
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"SectionFooter"];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

#pragma mark <UICollectionViewDataSource>
/** 1.多少个分区 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}
/** 2.每个分区多少项 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
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
    return nil;
    
}
/** 4.每个分区头或脚什么样 */
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
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
        default:
            break;
    }
    return CGSizeZero;
}
/** 6.每个分区内边距是多少 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsZero;
}
/** 7.最小行间距 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
/** 8.最小项间距 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
/** 9.头视图的尺寸 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeZero;
}
/** 10.脚视图的尺寸 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(0, 5);
}

@end

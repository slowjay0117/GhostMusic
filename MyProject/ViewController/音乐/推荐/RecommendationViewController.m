//
//  RecommendationViewController.m
//  MyProject
//
//  Created by will on 2017/8/22.
//  Copyright © 2017年 will. All rights reserved.
//

#import "RecommendationViewController.h"
#import "AdCell.h"

@interface RecommendationViewController ()<UICollectionViewDelegateFlowLayout,iCarouselDelegate,iCarouselDataSource>
@property (nonatomic, strong) UIPageControl *pc;
@end

@implementation RecommendationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //针对集合视图做一些基本设置
    self.collectionView.alwaysBounceVertical = YES;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    //注册每个分区的单元格类型及头、脚视图
    [self.collectionView registerClass:[AdCell class] forCellWithReuseIdentifier:@"AdCell"];

}

#pragma mark <UICollectionViewDataSource>
//1
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
//2
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}
//3
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        AdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AdCell" forIndexPath:indexPath];
        //为广告视图设置代理，设置完以后才会有具体的内容数据
        cell.ic.delegate = self;
        cell.ic.dataSource = self;
        
        cell.pc.numberOfPages = 5;
        //将创建的cell中的pageController记录到pc属性中，这样就可以在此方法外来访问控制pageController
        self.pc = cell.pc;
        //有了数据之后，启动一个定时器，三秒换一次图片
        [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            //修改广告视图的currentItemIndex+1
            [cell.ic scrollToItemAtIndex:cell.ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
        return cell;
    }
    return nil;
}
//4
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

#pragma mark - UICollectionViewDelegateFlowLayout 协议方法
//5
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            //375 / 150 = kWindowW / ???
            CGFloat height = kWindowW*150/357;
            return CGSizeMake(kWindowW, height);
        }
        default:
            break;
    }
    return CGSizeZero;
}
//6
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsZero;
}
//7
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
//8
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
//9
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeZero;
}
//10
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeZero;
}

#pragma mark - iCarouselDelegate,iCarouselDataSource 协议方法
//广告内容有几个
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return 5;
}
//每一个广告视图内容是什么
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    if (!view) {
        //如果没有重用的view，则根据委托方广告视图的大小创建等大的内容视图
        view = [[UIView alloc]initWithFrame:carousel.bounds];
        UIImageView *iv = [[UIImageView alloc]initWithFrame:view.bounds];
        [view addSubview:iv];
        iv.tag = 200;//添加标识，用于取出iv，赋值图片
    }
    //为iv赋值图片
    UIImageView *iv = (UIImageView *)[view viewWithTag:200];
    NSString *fileName = [NSString stringWithFormat:@"ad%ld.jpg", index+1];
    iv.image = [UIImage imageNamed:fileName];
    return view;
}
/** 广告项发生改变时，调用 */
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    //将pageController被选中的圆点下标和当前正在展示的广告项的下标保持一致即可
    self.pc.currentPage = carousel.currentItemIndex;
}
/** 控制循环显示 */
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}

@end

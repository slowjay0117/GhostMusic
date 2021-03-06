//
//  RecommendationViewController.m
//  MyProject
//
//  Created by will on 2017/8/22.
//  Copyright © 2017年 will. All rights reserved.
//

#import "RecommendationViewController.h"
#import "AdCell.h"
#import "NormalOptionCell.h"
#import "SectionHeaderView.h"
#import "ItemCell.h"
#import "RadioViewController.h"

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
    [self.collectionView registerNib:[UINib nibWithNibName:@"NormalOptionCell" bundle:nil] forCellWithReuseIdentifier:@"NormalOptionCell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"SectionFooter"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"SectionHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SectionHeaderView"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ItemCell" bundle:nil] forCellWithReuseIdentifier:@"ItemCell"];
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);

}

#pragma mark <UICollectionViewDataSource>
//1
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}
//2
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 1) {
        return 3;
    }
    if (section == 2) {
        return 6;
    }
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
    if (indexPath.section == 1) {
        NormalOptionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NormalOptionCell" forIndexPath:indexPath];
        NSArray *imageNames = @[@"geshou.jpg",@"diantai.jpg",@"huiyuanzhuanqu.jpg"];
        NSArray *titleNames = @[@"歌手",@"电台",@"会员专区"];
        [cell.optionImageView setImage:[[UIImage imageNamed:imageNames[indexPath.item]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        cell.optionLabel.text = titleNames[indexPath.item];
        return cell;
    }
    if (indexPath.section == 2) {
        ItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ItemCell" forIndexPath:indexPath];
        cell.imageView.image = [UIImage imageNamed:@"gedan7.jpg"];
        cell.titleLabel.text = @"听冬天的飘雪，寄片片相思";
        return cell;
    }
    return nil;
}
//4
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"SectionFooter" forIndexPath:indexPath];
        footer.backgroundColor = kRGBColor(245, 245, 245, 1.0);
        return footer;
    }
    if (indexPath.section == 2) {//头视图
        if (kind == UICollectionElementKindSectionHeader) {
            SectionHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SectionHeaderView" forIndexPath:indexPath];
            header.iconImageView.image = [UIImage imageNamed:@"r01"];
            header.titleLabel.text = @"歌单推荐";
            return header;
        }else{//脚视图
            UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"SectionFooter" forIndexPath:indexPath];
            footer.backgroundColor = kRGBColor(245, 245, 245, 1.0);
            return footer;
        }
    }
    return nil;
}

//选中项后的响应
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1 && indexPath.item == 1) {
        RadioViewController *vc = [RadioViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
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
        case 1:
        {
            CGFloat width = (long)((kWindowW - 2 * 20) / 3);
            return CGSizeMake(width, width);
        }
        case 2:
        {
            CGFloat width = (long)((kWindowW - 2 * 20 - 2*10)/3);
            return CGSizeMake(width, width+60);
        }
        default:
            break;
    }
    return CGSizeZero;
}
//6
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 1 || section == 2) {
        return UIEdgeInsetsMake(0, 20, 0, 20);
    }
    return UIEdgeInsetsZero;
}
//7
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
//8
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 2) {
        return 10;
    }
    return 0;
}
//9
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        return CGSizeMake(0, 60);
    }
    return CGSizeZero;
}
//10
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeZero;
    }
    return CGSizeMake(0, 5);
    
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

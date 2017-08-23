//
//  AdCell.m
//  MyProject
//
//  Created by will on 2017/8/22.
//  Copyright © 2017年 will. All rights reserved.
//

#import "AdCell.h"

@implementation AdCell

- (iCarousel *)ic{
    if(!_ic){
        _ic = [iCarousel  new];
        [self.contentView addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        //设置属性
        //切换内容的效果种类
        _ic.type = iCarouselTypeLinear;
        //设置滚动速度
        _ic.scrollSpeed = 0;
    }
    return _ic;
}

- (UIPageControl *)pc{
    if(!_pc){
        _pc = [UIPageControl  new];
        [_ic addSubview:_pc];
        [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(20);
        }];
        _pc.pageIndicatorTintColor = [UIColor whiteColor];
        _pc.currentPageIndicatorTintColor = kRGBColor(24, 190, 254, 1.0);
        _pc.userInteractionEnabled = NO;
    }
    return _pc;
}

@end

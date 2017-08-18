//
//  SongListLayout.m
//  MyProject
//
//  Created by will on 2017/8/18.
//  Copyright © 2017年 will. All rights reserved.
//

#import "SongListLayout.h"

@implementation SongListLayout

- (instancetype)init{
    if (self = [super init]) {
        self.minimumLineSpacing = 10;
        self.minimumInteritemSpacing = 10;
        self.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
        //计算一行显示三个时的宽度
        CGFloat width = (long)((kWindowW-2*20-2*10)/3);
        CGFloat height = width + 75;
        self.itemSize = CGSizeMake(width, height);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        //设置分区头大小
        self.headerReferenceSize = CGSizeMake(0, 45);
    }
    return self;
}

@end

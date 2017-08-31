//
//  RadioLayout.m
//  MyProject
//
//  Created by will on 2017/8/30.
//  Copyright © 2017年 will. All rights reserved.
//

#import "RadioLayout.h"

@implementation RadioLayout

- (instancetype)init{
    if (self = [super init]) {
        CGFloat width = (long)((kWindowW-92)/8);
        self.itemSize = CGSizeMake(width, width+30);
        self.minimumLineSpacing = width;
        self.minimumInteritemSpacing = width*1.5;
        self.sectionInset = UIEdgeInsetsMake(0, width, 0, width);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return self;
}
@end

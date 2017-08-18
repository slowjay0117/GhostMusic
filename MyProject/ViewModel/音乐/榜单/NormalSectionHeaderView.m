//
//  NormalSectionHeaderView.m
//  MyProject
//
//  Created by will on 2017/8/17.
//  Copyright © 2017年 will. All rights reserved.
//

#import "NormalSectionHeaderView.h"

@implementation NormalSectionHeaderView

- (instancetype)init{
    if ([super init]) {
        self.backgroundColor = [UIColor whiteColor];
        //播放按钮
        UIButton *playButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self addSubview:playButton];
        [playButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(95, 21));
            make.left.mas_equalTo(25);
            make.centerY.mas_equalTo(0);
        }];
        [playButton setImage:[[UIImage imageNamed:@"icon_bofang"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [playButton setTitle:@"播放全部" forState:UIControlStateNormal];
        [playButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [playButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 8, 0, 0)];
        //文字标签
        UILabel *numberLabel = [UILabel new];
        numberLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:numberLabel];
        [numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(playButton.mas_right).mas_equalTo(4);
            make.bottom.mas_equalTo(playButton);
        }];
        numberLabel.font = [UIFont systemFontOfSize:12];
        numberLabel.text = @"/100首歌";
        //下载按钮
        UIButton *downloadButton = [UIButton new];
        [self addSubview:downloadButton];
        [downloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(-24);
            make.size.mas_equalTo(CGSizeMake(43, 28));
        }];
        [downloadButton setBackgroundImage:[UIImage imageNamed:@"bt_playlist_download_normal"] forState:UIControlStateNormal];
        [downloadButton setBackgroundImage:[UIImage imageNamed:@"bt_playlist_download_press"] forState:UIControlStateHighlighted];
    }
    return self;
}

@end

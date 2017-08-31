//
//  RadioCell.m
//  MyProject
//
//  Created by will on 2017/8/30.
//  Copyright © 2017年 will. All rights reserved.
//

#import "RadioCell.h"

@implementation RadioCell

- (UIImageView *)iconImageView{
    if(!_iconImageView){
        _iconImageView = [UIImageView new];
        [self.contentView addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.height.mas_equalTo(_iconImageView.mas_width);
        }];
        _iconImageView.tintColor = kRGBColor(24, 190, 255, 1.0);
    }
    return _iconImageView;
}

- (UILabel *)sceneNameLabel{
    if(!_sceneNameLabel){
        _sceneNameLabel = [UILabel new];
        [self.contentView addSubview:_sceneNameLabel];
        [_sceneNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
        }];
        _sceneNameLabel.font = [UIFont systemFontOfSize:12];
        _sceneNameLabel.textColor = kRGBColor(24, 190, 255, 1.0);
    }
    return _sceneNameLabel;
}

@end

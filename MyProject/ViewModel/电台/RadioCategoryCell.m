//
//  RadioCategoryCell.m
//  MyProject
//
//  Created by will on 2017/8/30.
//  Copyright © 2017年 will. All rights reserved.
//

#import "RadioCategoryCell.h"

@implementation RadioCategoryCell

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = kRGBColor(130, 130, 130, 1.0);
        //设置标签的高亮状态下的颜色
        _titleLabel.highlightedTextColor = kRGBColor(24, 190, 255, 1.0);
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(8, 0, 8, 0));
        }];
    }
    return _titleLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

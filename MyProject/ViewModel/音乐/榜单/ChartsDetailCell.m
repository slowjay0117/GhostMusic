//
//  ChartsDetailCell.m
//  MyProject
//
//  Created by will on 2017/8/17.
//  Copyright © 2017年 will. All rights reserved.
//

#import "ChartsDetailCell.h"

@implementation ChartsDetailCell

#pragma mark - lazy loading
-(UILabel *)rankLable{
    if(!_rankLable){
        _rankLable = [UILabel new];
        _rankLable.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_rankLable];
        [_rankLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(22);
            make.top.mas_equalTo(11);
        }];
        [self moreButton];
    }
    return _rankLable;
}

-(UILabel *)titleLable{
    if(!_titleLable){
        _titleLable = [UILabel new];
        _titleLable.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_titleLable];
        [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.rankLable.mas_top);
            make.left.mas_equalTo(self.rankLable.mas_right).mas_equalTo(15);
        }];
    }
    return _titleLable;
}

-(UILabel *)authorLable{
    if(!_authorLable){
        _authorLable = [UILabel new];
        _authorLable.font = [UIFont systemFontOfSize:10];
        _authorLable.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_authorLable];
        [_authorLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLable.mas_bottom).mas_offset(3);
            make.bottom.mas_equalTo(-11);
            make.left.mas_greaterThanOrEqualTo(self.titleLable.mas_left);
            make.left.mas_equalTo(self.mtvImageView.mas_right).mas_equalTo(1);
        }];
    }
    return _authorLable;
}

-(UIButton *)moreButton{
    if(!_moreButton){
        _moreButton = [UIButton new];
        [self.contentView addSubview:_moreButton];
        [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(24, 24));
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(-20);
        }];
        [_moreButton setBackgroundImage:[UIImage imageNamed:@"bt_playlist_more_normal"] forState:UIControlStateNormal];
        [_moreButton setBackgroundImage:[UIImage imageNamed:@"bt_playlist_more_press"] forState:UIControlStateHighlighted];
    }
    return _moreButton;
}

-(UIImageView *)sqImageView{
    if(!_sqImageView){
        _sqImageView = [UIImageView new];
        [self.contentView addSubview:_sqImageView];
        [_sqImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(15, 11));
            make.top.mas_equalTo(self.titleLable.mas_bottom).mas_equalTo(3);
            make.left.mas_greaterThanOrEqualTo(self.titleLable);
            make.left.mas_equalTo(self.kingImageView.mas_right).mas_equalTo(1);
        }];
    }
    return _sqImageView;
}

-(UIImageView *)kingImageView{
    if(!_kingImageView){
        _kingImageView = [UIImageView new];
        [self.contentView addSubview:_kingImageView];
        [_kingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(15, 14));
            make.top.mas_equalTo(self.titleLable.mas_bottom).mas_equalTo(0);
            make.left.mas_equalTo(self.titleLable);
        }];
    }
    return _kingImageView;
}

-(UIImageView *)mtvImageView{
    if(!_mtvImageView){
        _mtvImageView = [UIImageView new];
        [self.contentView addSubview:_mtvImageView];
        [_mtvImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(15, 11));
            make.top.mas_equalTo(self.titleLable.mas_bottom).mas_equalTo(3);
            make.left.mas_greaterThanOrEqualTo(self.titleLable);
            make.left.mas_equalTo(self.sqImageView.mas_right).mas_equalTo(1);
        }];
    }
    return _mtvImageView;
}

@end

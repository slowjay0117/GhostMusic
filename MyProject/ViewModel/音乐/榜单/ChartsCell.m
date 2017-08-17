//
//  ChartsCell.m
//  MyProject
//
//  Created by will on 2017/8/16.
//  Copyright © 2017年 will. All rights reserved.
//

#import "ChartsCell.h"

@implementation ChartsCell

#pragma mark - lazy loading


-(UIImageView *)leftImageView{
    if(!_leftImageView){
        _leftImageView = [UIImageView new];
        //开启图片的用户交互功能，这样它内部的按钮才能响应用户的点击动作
        _leftImageView.userInteractionEnabled = YES;
        [self.contentView addSubview:_leftImageView];
        [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_offset(100);
            make.left.mas_equalTo(20);
            make.centerY.mas_equalTo(0);
        }];
        [self playButton];
    }
    return _leftImageView;
}

-(UIButton *)playButton{
    if(!_playButton){
        _playButton = [UIButton new];
        [self.leftImageView addSubview:_playButton];
        [_playButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(24);
            make.right.bottom.mas_equalTo(-5);
        }];
        [_playButton setBackgroundImage:[UIImage imageNamed:@"ic_limg_play_normal"] forState:UIControlStateNormal];
        [_playButton setBackgroundImage:[UIImage imageNamed:@"ic_limg_play_press"] forState:UIControlStateHighlighted];
    }
    return _playButton;
}

-(UIImageView *)num1ImageView{
    if(!_num1ImageView){
        _num1ImageView = [UIImageView new];
        [self.contentView addSubview:_num1ImageView];
        [_num1ImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.num2ImageView);
            make.size.mas_equalTo(self.num2ImageView);
            make.bottom.mas_equalTo(self.num2ImageView.mas_top).mas_equalTo(-12);
        }];
        _num1ImageView.image = [UIImage imageNamed:@"img_list_1"];
    }
    return _num1ImageView;
}

-(UILabel *)num1Lable{
    if(!_num1Lable){
        _num1Lable = [UILabel new];
        [self.contentView addSubview:_num1Lable];
        [_num1Lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.num1ImageView.mas_right).mas_equalTo(8);
            make.bottom.mas_equalTo(self.num2Lable.mas_top).mas_equalTo(-12);
        }];
        _num1Lable.font = [UIFont systemFontOfSize:12];
    }
    return _num1Lable;
}

-(UIImageView *)num2ImageView{
    if(!_num2ImageView){
        _num2ImageView = [UIImageView new];
        [self.contentView addSubview:_num2ImageView];
        [_num2ImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.leftImageView.mas_right).mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(10, 12));
        }];
        _num2ImageView.image = [UIImage imageNamed:@"img_list_2"];
        [self num3ImageView];
    }
    return _num2ImageView;
}

-(UILabel *)num2Lable{
    if(!_num2Lable){
        _num2Lable = [UILabel new];
        [self.contentView addSubview:_num2Lable];
        [_num2Lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.num2ImageView.mas_right).mas_equalTo(8);
        }];
        _num2Lable.font = [UIFont systemFontOfSize:12];
    }
    return _num2Lable;
}

-(UIImageView *)num3ImageView{
    if(!_num3ImageView){
        _num3ImageView = [UIImageView new];
        [self.contentView addSubview:_num3ImageView];
        [_num3ImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.num2ImageView);
            make.top.mas_equalTo(self.num2ImageView.mas_bottom).mas_equalTo(12);
            make.size.mas_equalTo(self.num2ImageView);
        }];
        _num3ImageView.image = [UIImage imageNamed:@"img_list_3"];
    }
    return _num3ImageView;
}

-(UILabel *)num3Lable{
    if(!_num3Lable){
        _num3Lable = [UILabel new];
        [self.contentView addSubview:_num3Lable];
        [_num3Lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.num2Lable);
            make.top.mas_equalTo(self.num2Lable.mas_bottom).mas_equalTo(12);
        }];
        _num3Lable.font = [UIFont systemFontOfSize:12];
    }
    return _num3Lable;
}

@end

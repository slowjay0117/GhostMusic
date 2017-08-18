//
//  SongListCell.m
//  MyProject
//
//  Created by will on 2017/8/18.
//  Copyright © 2017年 will. All rights reserved.
//

#import "SongListCell.h"

@implementation SongListCell

-(UIImageView *)posterImageView{
    if(!_posterImageView){
        _posterImageView = [UIImageView new];
        [self.contentView addSubview:_posterImageView];
        _posterImageView.userInteractionEnabled = YES;
        [_posterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(_posterImageView.mas_width);
        }];
        [self playButton];
    }
    return _posterImageView;
}

-(UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = [UILabel new];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.posterImageView.mas_bottom).mas_equalTo(6);
            make.left.right.mas_equalTo(0);
        }];
        _titleLabel.numberOfLines = 2;
        _titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _titleLabel;
}

-(UILabel *)crearorLabel{
    if(!_crearorLabel){
        _crearorLabel = [UILabel new];
        [self.contentView addSubview:_crearorLabel];
        [_crearorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_equalTo(2);
            make.left.right.mas_equalTo(0);
        }];
        _crearorLabel.textColor = [UIColor lightGrayColor];
        _crearorLabel.font = [UIFont systemFontOfSize:10];
    }
    return _crearorLabel;
}

-(UIButton *)playButton{
    if(!_playButton){
        _playButton = [UIButton new];
        [_posterImageView addSubview:_playButton];
        [_playButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.mas_equalTo(-4);
            make.size.mas_equalTo(22);
        }];
        [_playButton setImage:[UIImage imageNamed:@"ic_limg_play_normal"] forState:UIControlStateNormal];
        [_playButton setImage:[UIImage imageNamed:@"ic_limg_play_press"] forState:UIControlStateHighlighted];
    }
    return _playButton;
}

-(UILabel *)listenNumLabel{
    if(!_listenNumLabel){
        _listenNumLabel = [UILabel new];
        [self.posterImageView addSubview:_listenNumLabel];
        [_listenNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(3);
            make.bottom.mas_equalTo(-3);
        }];
        _listenNumLabel.font = [UIFont systemFontOfSize:8];
        _listenNumLabel.textColor = [UIColor whiteColor];
    }
    return _listenNumLabel;
}

@end

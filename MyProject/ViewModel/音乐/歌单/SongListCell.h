//
//  SongListCell.h
//  MyProject
//
//  Created by will on 2017/8/18.
//  Copyright © 2017年 will. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongListCell : UICollectionViewCell
/** 图片封面 */
@property (nonatomic, strong) UIImageView *posterImageView;
/** 文字标签 */
@property (nonatomic, strong) UILabel *titleLabel;
/** 创建者标签 */
@property (nonatomic, strong) UILabel *crearorLabel;
/** 播放按钮 */
@property (nonatomic, strong) UIButton *playButton;
/** 播放数标签 */
@property (nonatomic, strong) UILabel *listenNumLabel;
@end

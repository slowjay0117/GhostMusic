//
//  ChartsDetailCell.h
//  MyProject
//
//  Created by will on 2017/8/17.
//  Copyright © 2017年 will. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChartsDetailCell : UITableViewCell

/** 排名标签 */
@property (nonatomic, strong) UILabel *rankLable;
/** 歌曲名称标签 */
@property (nonatomic, strong) UILabel *titleLable;
/** 演唱者名称标签 */
@property (nonatomic, strong) UILabel *authorLable;
/** 更多操作的那个按钮 */
@property (nonatomic, strong) UIButton *moreButton;
/** SQ图片 */
@property (nonatomic, strong) UIImageView *sqImageView;
/** king图片 */
@property (nonatomic, strong) UIImageView *kingImageView;
/** mv图片 */
@property (nonatomic, strong) UIImageView *mtvImageView;
@end

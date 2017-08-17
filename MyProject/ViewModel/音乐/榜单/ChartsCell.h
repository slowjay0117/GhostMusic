//
//  ChartsCell.h
//  MyProject
//
//  Created by will on 2017/8/16.
//  Copyright © 2017年 will. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChartsCell : UITableViewCell

/** 左侧的图片 */
@property (nonatomic, strong) UIImageView *leftImageView;
/** 播放图片 */
@property (nonatomic, strong) UIButton *playButton;
/** image1 */
@property (nonatomic, strong) UIImageView *num1ImageView;
/** label1 */
@property (nonatomic, strong) UILabel *num1Lable;
/** image2 */
@property (nonatomic, strong) UIImageView *num2ImageView;
/** label2 */
@property (nonatomic, strong) UILabel *num2Lable;
/** image3 */
@property (nonatomic, strong) UIImageView *num3ImageView;
/** label3 */
@property (nonatomic, strong) UILabel *num3Lable;

@end

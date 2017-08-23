//
//  SectionHeaderView.h
//  MyProject
//
//  Created by will on 2017/8/23.
//  Copyright © 2017年 will. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionHeaderView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;

@end

//
//  AppDelegate.h
//  MyProject
//
//  Created by will on 2017/4/24.
//  Copyright © 2017年 will. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic,getter=isOnLine) BOOL onLine; //网络状态
@end


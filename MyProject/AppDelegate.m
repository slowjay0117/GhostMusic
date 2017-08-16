//
//  AppDelegate.m
//  MyProject
//
//  Created by will on 2017/4/24.
//  Copyright © 2017年 will. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    MainViewController *mainVC = [MainViewController new];
    self.window.rootViewController = mainVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end

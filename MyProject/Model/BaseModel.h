//
//  BaseModel.h
//  MyProject
//
//  Created by will on 2017/4/24.
//  Copyright © 2017年 will. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
// 单例模式，返回唯一的数据库对象
+ (FMDatabase *)defaultDatabase;

@end

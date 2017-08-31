//
//  SceneModel.h
//  MyProject
//
//  Created by will on 2017/8/30.
//  Copyright © 2017年 will. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SceneModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *image;

/**
 *  @author will, 17-08-30 17:08:39
 *
 *  在数组的后面添加尖括号，并且使用某一个类型名占位
 *  这种写法也叫 泛型,目的就是保证类型安全，不是这种类型的数据
 *  不能添加到数组中，从数组中取出的数据不再是id类型，无需进行
 *  类型转换，就变成尖括号中的类型了
 *  作用：此数组内的每一个元素都是 尖括号 里面的那个类型的
 *
 */
+ (NSArray<SceneModel *> *)demoData;

@end

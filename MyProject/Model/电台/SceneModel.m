//
//  SceneModel.m
//  MyProject
//
//  Created by will on 2017/8/30.
//  Copyright © 2017年 will. All rights reserved.
//

#import "SceneModel.h"

@implementation SceneModel

+ (NSArray<SceneModel *> *)demoData{
    NSMutableArray<SceneModel *> *allScenes = [NSMutableArray array];
    //为了加载plist文件，先构建文件的路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"scene" ofType:@"plist"];
    //读取plist文件，因为plist文件的顶级节点是array类型
    //所以使用NSArray存储读取的数据
    NSArray *allData = [NSArray arrayWithContentsOfFile:filePath];
    //遍历数组，将每一个字典转成模型
    for (NSDictionary *dict in allData) {
        SceneModel *model = [SceneModel new];
        //将字典中各个key对应的值读取出来，存到model对象中
        model.name = dict[@"name"];
        model.image = dict[@"image"];
        [allScenes addObject:model];
    }
    return [allScenes copy];
}

@end

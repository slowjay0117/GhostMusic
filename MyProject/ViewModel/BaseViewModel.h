//
//  BaseViewModel.h
//  MyProject
//
//  Created by will on 2017/4/24.
//  Copyright © 2017年 will. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CompletionHandle)(NSError *error);

@protocol BaseViewModelDelegate <NSObject>

@optional
// 获取更多
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle;
// 刷新
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle;
// 获取数据
- (void)getDataFromNetCompletionHandle:(CompletionHandle)completionHandle;

@end

@interface BaseViewModel : NSObject<BaseViewModelDelegate>

@property (nonatomic,strong) NSMutableArray *dataArr;
@property (nonatomic,strong) NSURLSessionDataTask *dataTask;
- (void)cancelTask;     // 取消任务
- (void)suspendTask;    // 暂停任务
- (void)resumeTask;     // 继续任务

@end

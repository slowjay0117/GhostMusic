//
//  BaseNetManager.m
//  MyProject
//
//  Created by will on 2017/4/24.
//  Copyright © 2017年 will. All rights reserved.
//

#import "BaseNetManager.h"

static AFHTTPSessionManager *manager = nil;

@implementation BaseNetManager

+ (AFHTTPSessionManager *)sharedAFManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    });
    return manager;
}

// 方法：把path和参数拼接起来，把字符串中的中文转换为 百分号 形式，因为有的服务器不接收中文编码
//+ (NSString *)percentPathWithPath:(NSString *)path params:(NSDictionary *)params{
//    NSMutableString *percentPath = [NSMutableString stringWithString:path];
//    NSArray *keys = params.allKeys;
//    NSInteger count = keys.count;
//    // OC语言特性是runtime，实际上我们调用一个方法，底层操作是 在一个方法列表中搜索你调用的方法所在的地址，然后调用完毕之后把这个方法名转移到常用方法列表。所以如果再次执行某个方法就在常用方法列表中搜索调用，效率更高。
//    for (int i = 0; i < count; i++) {
//        if (i == 0) {
//            [percentPath appendFormat:@"?%@=%@", keys[i], params[keys[i]]];
//        } else {
//            [percentPath appendFormat:@"&%@=%@", keys[i], params[keys[i]]];
//        }
//    }
//    // 把字符串中的中文转为%号形式
//    return [percentPath stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//}

+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    //打印网络请求， DDLog  与  NSLog 功能一样
//    path = [self percentPathWithPath:path params:params];
//    DDLogVerbose(@"Request Path: %@", path);
    return [[self sharedAFManager] GET:path parameters:params success:^void(NSURLSessionDataTask * task, id responseObject) {
        complete(responseObject, nil);
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        complete(nil, error);
    }];
}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    return [[self sharedAFManager] POST:path parameters:params success:^void(NSURLSessionDataTask * task, id responseObject) {
        complete(responseObject, nil);
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        [self handleError:error];
        complete(nil, error);
    }];
}

+ (void)handleError:(NSError *)error{
    [[self new] showErrorMsg:error]; //弹出错误信息
}

@end

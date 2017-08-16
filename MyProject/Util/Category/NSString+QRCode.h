//
//  NSString+QRCode.h
//  MyProject
//
//  Created by will on 2017/4/24.
//  Copyright © 2017年 will. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (QRCode)

- (UIImage *)imageForQRCode:(CGFloat)width;

@end

//
//  NSDate+MingleChang.h
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (MingleChang)

/**
 将NSDate按照format转换为时间字符串

 @param format <#format description#>
 @return <#return value description#>
 */
-(NSString *)mc_toStringWithFormat:(NSString *)format;
-(NSString *)mc_toStringWithFormat:(NSString *)format timeZone:(nullable NSTimeZone *)timeZone;

@end

NS_ASSUME_NONNULL_END

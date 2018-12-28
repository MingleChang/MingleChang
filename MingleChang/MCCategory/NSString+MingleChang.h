//
//  NSString+MingleChang.h
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MingleChang)

/**
 将中文字符串转为拼音字符串

 @return <#return value description#>
 */
- (NSString *)mc_toPinyin;


/**
 将时间字符串按照时间格式format转换为一个NSDate对象

 @param format <#format description#>
 @return <#return value description#>
 */
-(NSDate *)mc_toDateWithFormat:(NSString *)format;
-(NSDate *)mc_toDateWithFormat:(NSString *)format timeZone:(nullable NSTimeZone *)timeZone;

@end

NS_ASSUME_NONNULL_END

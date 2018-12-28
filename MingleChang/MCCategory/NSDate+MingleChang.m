//
//  NSDate+MingleChang.m
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#import "NSDate+MingleChang.h"

@implementation NSDate (MingleChang)
-(NSString *)mc_toStringWithFormat:(NSString *)format{
    return [self mc_toStringWithFormat:format timeZone:nil];
}
-(NSString *)mc_toStringWithFormat:(NSString *)format timeZone:(nullable NSTimeZone *)timeZone{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    if (timeZone) {
        [dateFormatter setTimeZone:timeZone];
    }
    NSString *lString=[dateFormatter stringFromDate:self];
    return lString;
}
@end

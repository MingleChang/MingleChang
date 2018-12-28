//
//  NSString+MingleChang.m
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#import "NSString+MingleChang.h"

@implementation NSString (MingleChang)

- (NSString *)mc_toPinyin {
    NSMutableString *str = [[NSMutableString alloc]initWithString:self];
    CFStringTransform((__bridge CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    return [str copy];
}

#pragma mark - Date
-(NSDate *)mc_toDateWithFormat:(NSString *)format {
    return [self mc_toDateWithFormat:format timeZone:nil];
}

-(NSDate *)mc_toDateWithFormat:(NSString *)format timeZone:(nullable NSTimeZone *)timeZone {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    if (timeZone) {
        [dateFormatter setTimeZone:timeZone];
    }
    NSDate *lDate= [dateFormatter dateFromString:self];
    return lDate;
}
@end

//
//  NSString+MingleChang.m
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#import "NSString+MingleChang.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation NSString (MingleChang)
- (BOOL)mc_isRegex:(NSString *)regex {
    NSPredicate *lPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if (([lPredicate evaluateWithObject:self])) {
        return YES;
    }
    return NO;
}

- (BOOL)mc_isRealIDCard {
    if (self.length != 18) {
        return NO;
    }
    const char *cardNumber = [[self lowercaseString] UTF8String];
    int ds[] = {7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2};
    int total = 0;
    
    for (int i = 0; i < 17; i++) {
        char code = cardNumber[i];
        int num = code - 48;
        int dsi = ds[i];
        total += num * dsi;
    }
    
    total = total % 11;
    char ends[] = {'1', '0', 'x', '9', '8', '7', '6', '5', '4', '3', '2'};
    char end = ends[total];
    char last = cardNumber[17];
    
    if (end == last) {
        return YES;
    }
    return NO;
}

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

#pragma mark - 加密解密
- (NSString *)mc_md5 {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr,(CC_LONG)strlen(cStr), result); // This is the md5 call
    
    NSString *lString = @"";
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        lString = [lString stringByAppendingFormat:@"%02x",result[i]];
    }
    return lString;
}

- (NSString*) mc_sha1 {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(cStr, (CC_LONG)strlen(cStr), result);
    
    NSString *lString = @"";
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        lString = [lString stringByAppendingFormat:@"%02x",result[i]];
    }
    return lString;
}

@end

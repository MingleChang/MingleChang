//
//  NSString+MingleChang.m
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#import "NSString+MingleChang.h"
#import "NSNumber+MingleChang.h"
#import "NSData+MingleChang.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation NSString (MingleChang)

- (NSString *)mc_trim {
    NSCharacterSet *lCharacterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *lString = [self stringByTrimmingCharactersInSet:lCharacterSet];
    return lString;
}

- (NSNumber *)mc_toNumber {
    NSNumber *lNumber = [NSNumber mc_numberWithString:self];
    return lNumber;
}

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
    NSMutableString *lString = [[NSMutableString alloc]initWithString:self];
    CFStringTransform((__bridge CFMutableStringRef)lString, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)lString, NULL, kCFStringTransformStripDiacritics, NO);
    return [lString copy];
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
- (NSData *)mc_md2Data {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_md2Data];
}
- (NSString *)mc_md2String {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_md2String];
}
- (NSData *)mc_md4Data {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_md4Data];
}
- (NSString *)mc_md4String {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_md4String];
}
- (NSData *)mc_md5Data {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_md5Data];
}
- (NSString *)mc_md5String {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_md5String];
}
- (NSData *)mc_sha1Data {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_sha1Data];
}
- (NSString *)mc_sha1String {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_sha1String];
}
- (NSData *)mc_sha224Data {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_sha224Data];
}
- (NSString *)mc_sha224String {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_sha224String];
}
- (NSData *)mc_sha256Data {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_sha256Data];
}
- (NSString *)mc_sha256String {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_sha256String];
}
- (NSData *)mc_sha384Data {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_sha384Data];
}
- (NSString *)mc_sha384String {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_sha384String];
}
- (NSData *)mc_sha512Data {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_sha512Data];
}
- (NSString *)mc_sha512String {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_sha512String];
}
- (NSData *)mc_hmacDataUsingAlg:(CCHmacAlgorithm)algorithm key:(NSData *)key {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_hmacDataUsingAlg:algorithm key:key];
}
- (NSString *)mc_hmacStringUsingAlg:(CCHmacAlgorithm)algorithm key:(NSString *)key {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_hmacStringUsingAlg:algorithm key:key];
}
- (NSData *)mc_hmacMD5DataWithKey:(NSData *)key {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_hmacMD5DataWithKey:key];
}
- (NSString *)mc_hmacMD5StringWithKey:(NSString *)key {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_hmacMD5StringWithKey:key];
}
- (NSData *)mc_hmacSHA1DataWithKey:(NSData *)key {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_hmacSHA1DataWithKey:key];
}
- (NSString *)mc_hmacSHA1StringWithKey:(NSString *)key {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_hmacSHA1StringWithKey:key];
}
- (NSData *)mc_hmacSHA224DataWithKey:(NSData *)key {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_hmacSHA224DataWithKey:key];
}
- (NSString *)mc_hmacSHA224StringWithKey:(NSString *)key {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_hmacSHA224StringWithKey:key];
}
- (NSData *)mc_hmacSHA256DataWithKey:(NSData *)key {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_hmacSHA256DataWithKey:key];
}
- (NSString *)mc_hmacSHA256StringWithKey:(NSString *)key {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_hmacSHA256StringWithKey:key];
}
- (NSData *)mc_hmacSHA384DataWithKey:(NSData *)key {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_hmacSHA384DataWithKey:key];
}
- (NSString *)mc_hmacSHA384StringWithKey:(NSString *)key {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_hmacSHA384StringWithKey:key];
}
- (NSData *)mc_hmacSHA512DataWithKey:(NSData *)key {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_hmacSHA512DataWithKey:key];
}
- (NSString *)mc_hmacSHA512StringWithKey:(NSString *)key  {
    NSData *lData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [lData mc_hmacSHA512StringWithKey:key];
}

@end

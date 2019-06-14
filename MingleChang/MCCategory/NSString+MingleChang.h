//
//  NSString+MingleChang.h
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonHMAC.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MingleChang)

/**
 去除字符串首尾的空格和换行字符

 @return <#return value description#>
 */
- (NSString *)mc_trim;

/**
 将字符串转换为number，如字符串不是一个数字字符串将返回nil

 @return <#return value description#>
 */
- (NSNumber *)mc_toNumber;

/**
 检查是否满足指定的正则表达式

 @param regex 正则表达式
 @return <#return value description#>
 */
- (BOOL)mc_isRegex:(NSString *)regex;

/**
 检查是否是合法的身份证号

 @return <#return value description#>
 */
- (BOOL)mc_isRealIDCard;

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

//加密和解密
- (NSString *)mc_urlEncode;
- (NSString *)mc_urlDecode;
- (NSData *)mc_md2Data;
- (NSString *)mc_md2String;
- (NSData *)mc_md4Data;
- (NSString *)mc_md4String;
- (NSData *)mc_md5Data;
- (NSString *)mc_md5String;
- (NSData *)mc_sha1Data;
- (NSString *)mc_sha1String;
- (NSData *)mc_sha224Data;
- (NSString *)mc_sha224String;
- (NSData *)mc_sha256Data;
- (NSString *)mc_sha256String;
- (NSData *)mc_sha384Data;
- (NSString *)mc_sha384String;
- (NSData *)mc_sha512Data;
- (NSString *)mc_sha512String;
- (NSData *)mc_hmacDataUsingAlg:(CCHmacAlgorithm)algorithm key:(NSData *)key;
- (NSString *)mc_hmacStringUsingAlg:(CCHmacAlgorithm)algorithm key:(NSString *)key;
- (NSData *)mc_hmacMD5DataWithKey:(NSData *)key;
- (NSString *)mc_hmacMD5StringWithKey:(NSString *)key;
- (NSData *)mc_hmacSHA1DataWithKey:(NSData *)key;
- (NSString *)mc_hmacSHA1StringWithKey:(NSString *)key;
- (NSData *)mc_hmacSHA224DataWithKey:(NSData *)key;
- (NSString *)mc_hmacSHA224StringWithKey:(NSString *)key;
- (NSData *)mc_hmacSHA256DataWithKey:(NSData *)key;
- (NSString *)mc_hmacSHA256StringWithKey:(NSString *)key;
- (NSData *)mc_hmacSHA384DataWithKey:(NSData *)key;
- (NSString *)mc_hmacSHA384StringWithKey:(NSString *)key;
- (NSData *)mc_hmacSHA512DataWithKey:(NSData *)key;
- (NSString *)mc_hmacSHA512StringWithKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END

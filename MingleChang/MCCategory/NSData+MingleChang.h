//
//  NSData+MingleChang.h
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonHMAC.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (MingleChang)

/**
 *  一种加密解密算法，之前项目中使用过，特此记住
 *
 *  @return NSData，加密解密后的数据
 */
-(NSData *)mc_encrypt_one;

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

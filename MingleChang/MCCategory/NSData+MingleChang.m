//
//  NSData+MingleChang.m
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#import "NSData+MingleChang.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation NSData (MingleChang)

#pragma mark - 加密和解密
-(NSData *)mc_encrypt_one{
    int p_IA1 = 0x2DB12EE;
    int p_IC1 = 0x013A85F;
    int M_Key = 0x534CA75;
    int ID_Key = 0x2EAD25A;
    
    int Key_0=M_Key;
    int ID_0=ID_Key;
    
    Byte *byte=(Byte *)self.bytes;
    for (int i=0; i<self.length; ++i) {
        Key_0 = p_IA1 * (Key_0 % ID_0) + p_IC1;
        byte[i] ^= ((Key_0 >> 15) + 0xe3) & 0xFF;
    }
    
    NSData *lData=[NSData dataWithBytes:byte length:self.length];
    return lData;
}

- (NSData *)mc_md2Data {
    unsigned char lResult[CC_MD2_DIGEST_LENGTH];
    CC_MD2(self.bytes, (CC_LONG)self.length, lResult);
    NSData *lData = [NSData dataWithBytes:lResult length:CC_MD2_DIGEST_LENGTH];
    return lData;
}
- (NSString *)mc_md2String {
    unsigned char lResult[CC_MD2_DIGEST_LENGTH];
    CC_MD2(self.bytes, (CC_LONG)self.length, lResult);
    NSString *lString = @"";
    for (int i = 0; i < CC_MD2_DIGEST_LENGTH; ++i) {
        lString = [lString stringByAppendingFormat:@"%02x",lResult[i]];
    }
    return lString;
}
- (NSData *)mc_md4Data {
    unsigned char lResult[CC_MD4_DIGEST_LENGTH];
    CC_MD4(self.bytes, (CC_LONG)self.length, lResult);
    NSData *lData = [NSData dataWithBytes:lResult length:CC_MD4_DIGEST_LENGTH];
    return lData;
}
- (NSString *)mc_md4String {
    unsigned char lResult[CC_MD4_DIGEST_LENGTH];
    CC_MD4(self.bytes, (CC_LONG)self.length, lResult);
    NSString *lString = @"";
    for (int i = 0; i < CC_MD4_DIGEST_LENGTH; ++i) {
        lString = [lString stringByAppendingFormat:@"%02x",lResult[i]];
    }
    return lString;
}
- (NSData *)mc_md5Data {
    unsigned char lResult[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, lResult);
    NSData *lData = [NSData dataWithBytes:lResult length:CC_MD5_DIGEST_LENGTH];
    return lData;
}
- (NSString *)mc_md5String {
    unsigned char lResult[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, lResult);
    NSString *lString = @"";
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; ++i) {
        lString = [lString stringByAppendingFormat:@"%02x",lResult[i]];
    }
    return lString;
}
- (NSData *)mc_sha1Data {
    unsigned char lResult[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(self.bytes, (CC_LONG)self.length, lResult);
    NSData *lData = [NSData dataWithBytes:lResult length:CC_SHA1_DIGEST_LENGTH];
    return lData;
}
- (NSString *)mc_sha1String {
    unsigned char lResult[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(self.bytes, (CC_LONG)self.length, lResult);
    NSString *lString = @"";
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; ++i) {
        lString = [lString stringByAppendingFormat:@"%02x",lResult[i]];
    }
    return lString;
}
- (NSData *)mc_sha224Data {
    unsigned char lResult[CC_SHA224_DIGEST_LENGTH];
    CC_SHA224(self.bytes, (CC_LONG)self.length, lResult);
    NSData *lData = [NSData dataWithBytes:lResult length:CC_SHA224_DIGEST_LENGTH];
    return lData;
}
- (NSString *)mc_sha224String {
    unsigned char lResult[CC_SHA224_DIGEST_LENGTH];
    CC_SHA224(self.bytes, (CC_LONG)self.length, lResult);
    NSString *lString = @"";
    for (int i = 0; i < CC_SHA224_DIGEST_LENGTH; ++i) {
        lString = [lString stringByAppendingFormat:@"%02x",lResult[i]];
    }
    return lString;
}
- (NSData *)mc_sha256Data {
    unsigned char lResult[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(self.bytes, (CC_LONG)self.length, lResult);
    NSData *lData = [NSData dataWithBytes:lResult length:CC_SHA256_DIGEST_LENGTH];
    return lData;
}
- (NSString *)mc_sha256String {
    unsigned char lResult[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(self.bytes, (CC_LONG)self.length, lResult);
    NSString *lString = @"";
    for (int i = 0; i < CC_SHA256_DIGEST_LENGTH; ++i) {
        lString = [lString stringByAppendingFormat:@"%02x",lResult[i]];
    }
    return lString;
}
- (NSData *)mc_sha384Data {
    unsigned char lResult[CC_SHA384_DIGEST_LENGTH];
    CC_SHA384(self.bytes, (CC_LONG)self.length, lResult);
    NSData *lData = [NSData dataWithBytes:lResult length:CC_SHA384_DIGEST_LENGTH];
    return lData;
}
- (NSString *)mc_sha384String {
    unsigned char lResult[CC_SHA384_DIGEST_LENGTH];
    CC_SHA384(self.bytes, (CC_LONG)self.length, lResult);
    NSString *lString = @"";
    for (int i = 0; i < CC_SHA384_DIGEST_LENGTH; ++i) {
        lString = [lString stringByAppendingFormat:@"%02x",lResult[i]];
    }
    return lString;
}
- (NSData *)mc_sha512Data {
    unsigned char lResult[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(self.bytes, (CC_LONG)self.length, lResult);
    NSData *lData = [NSData dataWithBytes:lResult length:CC_SHA512_DIGEST_LENGTH];
    return lData;
}
- (NSString *)mc_sha512String {
    unsigned char lResult[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(self.bytes, (CC_LONG)self.length, lResult);
    NSString *lString = @"";
    for (int i = 0; i < CC_SHA512_DIGEST_LENGTH; ++i) {
        lString = [lString stringByAppendingFormat:@"%02x",lResult[i]];
    }
    return lString;
}
- (NSData *)mc_hmacDataUsingAlg:(CCHmacAlgorithm)algorithm key:(NSData *)key {
    size_t length;
    switch (algorithm) {
        case kCCHmacAlgMD5:{
            length = CC_MD5_DIGEST_LENGTH;
        }break;
        case kCCHmacAlgSHA1:{
            length = CC_SHA1_DIGEST_LENGTH;
        }break;
        case kCCHmacAlgSHA224:{
            length = CC_SHA224_DIGEST_LENGTH;
        }break;
        case kCCHmacAlgSHA256:{
            length = CC_SHA256_DIGEST_LENGTH;
        }break;
        case kCCHmacAlgSHA384:{
            length = CC_SHA384_DIGEST_LENGTH;
        }break;
        case kCCHmacAlgSHA512:{
            length = CC_SHA512_DIGEST_LENGTH;
        }break;
        default:{
            return nil;
        }break;
    }
    unsigned char lResult[length];
    CCHmac(algorithm, [key bytes], key.length, self.bytes, self.length, lResult);
    NSData *lData = [NSData dataWithBytes:lResult length:CC_SHA384_DIGEST_LENGTH];
    return lData;
}
- (NSString *)mc_hmacStringUsingAlg:(CCHmacAlgorithm)algorithm key:(NSString *)key {
    size_t length;
    switch (algorithm) {
        case kCCHmacAlgMD5:{
            length = CC_MD5_DIGEST_LENGTH;
        }break;
        case kCCHmacAlgSHA1:{
            length = CC_SHA1_DIGEST_LENGTH;
        }break;
        case kCCHmacAlgSHA224:{
            length = CC_SHA224_DIGEST_LENGTH;
        }break;
        case kCCHmacAlgSHA256:{
            length = CC_SHA256_DIGEST_LENGTH;
        }break;
        case kCCHmacAlgSHA384:{
            length = CC_SHA384_DIGEST_LENGTH;
        }break;
        case kCCHmacAlgSHA512:{
            length = CC_SHA512_DIGEST_LENGTH;
        }break;
        default:{
            return nil;
        }break;
    }
    unsigned char lResult[length];
    const char *cKey = [key UTF8String];
    CCHmac(algorithm, cKey, strlen(cKey), self.bytes, self.length, lResult);
    NSString *lString = @"";
    for (int i = 0; i < length; ++i) {
        lString = [lString stringByAppendingFormat:@"%02x",lResult[i]];
    }
    return lString;
}
- (NSData *)mc_hmacMD5DataWithKey:(NSData *)key {
    NSData *lData = [self mc_hmacDataUsingAlg:kCCHmacAlgMD5 key:key];
    return lData;
}
- (NSString *)mc_hmacMD5StringWithKey:(NSString *)key {
    NSString *lString = [self mc_hmacStringUsingAlg:kCCHmacAlgMD5 key:key];
    return lString;
}
- (NSData *)mc_hmacSHA1DataWithKey:(NSData *)key {
    NSData *lData = [self mc_hmacDataUsingAlg:kCCHmacAlgSHA1 key:key];
    return lData;
}
- (NSString *)mc_hmacSHA1StringWithKey:(NSString *)key {
    NSString *lString = [self mc_hmacStringUsingAlg:kCCHmacAlgSHA1 key:key];
    return lString;
}
- (NSData *)mc_hmacSHA224DataWithKey:(NSData *)key {
    NSData *lData = [self mc_hmacDataUsingAlg:kCCHmacAlgSHA224 key:key];
    return lData;
}
- (NSString *)mc_hmacSHA224StringWithKey:(NSString *)key {
    NSString *lString = [self mc_hmacStringUsingAlg:kCCHmacAlgSHA224 key:key];
    return lString;
}
- (NSData *)mc_hmacSHA256DataWithKey:(NSData *)key {
    NSData *lData = [self mc_hmacDataUsingAlg:kCCHmacAlgSHA256 key:key];
    return lData;
}
- (NSString *)mc_hmacSHA256StringWithKey:(NSString *)key {
    NSString *lString = [self mc_hmacStringUsingAlg:kCCHmacAlgSHA256 key:key];
    return lString;
}
- (NSData *)mc_hmacSHA384DataWithKey:(NSData *)key {
    NSData *lData = [self mc_hmacDataUsingAlg:kCCHmacAlgSHA384 key:key];
    return lData;
}
- (NSString *)mc_hmacSHA384StringWithKey:(NSString *)key {
    NSString *lString = [self mc_hmacStringUsingAlg:kCCHmacAlgSHA384 key:key];
    return lString;
}
- (NSData *)mc_hmacSHA512DataWithKey:(NSData *)key {
    NSData *lData = [self mc_hmacDataUsingAlg:kCCHmacAlgSHA512 key:key];
    return lData;
}
- (NSString *)mc_hmacSHA512StringWithKey:(NSString *)key {
    NSString *lString = [self mc_hmacStringUsingAlg:kCCHmacAlgSHA512 key:key];
    return lString;
}
@end

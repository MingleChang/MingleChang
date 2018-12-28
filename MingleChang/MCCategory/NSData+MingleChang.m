//
//  NSData+MingleChang.m
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#import "NSData+MingleChang.h"

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
    for (int i=0; i<self.length; i++) {
        Key_0 = p_IA1 * (Key_0 % ID_0) + p_IC1;
        byte[i] ^= ((Key_0 >> 15) + 0xe3) & 0xFF;
    }
    
    NSData *lData=[NSData dataWithBytes:byte length:self.length];
    return lData;
}

@end

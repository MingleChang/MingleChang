//
//  NSData+MingleChang.h
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (MingleChang)

/**
 *  一种加密解密算法，之前项目中使用过，特此记住
 *
 *  @return NSData，加密解密后的数据
 */
-(NSData *)mc_encrypt_one;

@end

NS_ASSUME_NONNULL_END

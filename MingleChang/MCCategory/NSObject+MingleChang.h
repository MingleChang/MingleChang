//
//  NSObject+MingleChang.h
//  MingleChang
//
//  Created by gongtao on 2019/1/2.
//  Copyright © 2019 mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MingleChang)

/**
 返回当前类的类名字符串

 @return <#return value description#>
 */
+ (NSString *)mc_className;

/**
 返回当前对象的类名字符串

 @return <#return value description#>
 */
- (NSString *)mc_className;

/**
 交换类的实例方法

 @param oldSelector <#oldSelector description#>
 @param newSelector <#newSelector description#>
 */
+(void)mc_exchangeInstanceOldSelector:(SEL)oldSelector newSelector:(SEL)newSelector;

/**
 交换类的类方法

 @param oldSelector <#oldSelector description#>
 @param newSelector <#newSelector description#>
 */
+(void)mc_exchangeClassOldSelector:(SEL)oldSelector newSelector:(SEL)newSelector;

@end

NS_ASSUME_NONNULL_END

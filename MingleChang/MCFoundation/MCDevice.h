//
//  MCDevice.h
//  MingleChang
//
//  Created by gongtao on 2019/1/3.
//  Copyright © 2019 mingle. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MCDevice : NSObject

//Bundle Info
+ (NSString *)bundleName;
+ (NSString *)bundleIdentifier;
+ (NSString *)appVersion;
+ (NSString *)buildVersion;
+ (BOOL)iPhone;
+ (BOOL)iPad;
/**
 是否是模拟器

 @return <#return value description#>
 */
+ (BOOL)isSimulator;

/**
 检查是否越狱

 @return <#return value description#>
 */
+ (BOOL)isJailbroken;

/**
 检查是否破解

 @return <#return value description#>
 */
+ (BOOL)isPirated;
@end

NS_ASSUME_NONNULL_END

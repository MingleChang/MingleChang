//
//  UIColor+MingleChang.h
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (MingleChang)

/**
 使用十六进制颜色值生成UIColor

 @param hex 颜色的十六进制值
 @param alpha 颜色的alpha值
 @return <#return value description#>
 */
+ (UIColor *)mc_colorWithHex:(NSInteger)hex alpha:(CGFloat)alpha;

/**
 使用十六进制颜色值生成UIColor

 @param hex 颜色的十六进制值
 @return <#return value description#>
 */
+ (UIColor *)mc_colorWithHex:(NSInteger)hex;

@end

NS_ASSUME_NONNULL_END

//
//  UIColor+MingleChang.m
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#import "UIColor+MingleChang.h"

@implementation UIColor (MingleChang)
+ (UIColor *)mc_colorWithHex:(NSInteger)hex alpha:(CGFloat)alpha {
    CGFloat red = ((hex & 0xFF0000) >> 16)/255.0;
    CGFloat green = ((hex & 0xFF00) >> 8)/255.0;
    CGFloat blue = (hex & 0xFF)/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}
+ (UIColor *)mc_colorWithHex:(NSInteger)hex {
    return [UIColor mc_colorWithHex:hex alpha:1.0];
}
@end

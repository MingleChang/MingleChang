//
//  UIView+MingleChang.h
//  MingleChang
//
//  Created by MingleChang on 16/6/13.
//  Copyright © 2016年 MingleChang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MingleChang)
/*
 获取point位置的颜色
 */
-(UIColor *)mc_colorOfPoint:(CGPoint)point;
/*
 获取point位置的alpha值
 */
-(CGFloat)mc_alphaOfPoint:(CGPoint)point;
@end

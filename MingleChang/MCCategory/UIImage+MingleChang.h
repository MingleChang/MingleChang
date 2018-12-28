//
//  UIImage+MingleChang.h
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (MingleChang)
/**
 *  将image的缩小或者放大到size，不产生虚边和锯齿
 *
 *  @param size CGSize，image设置后的尺寸大小
 *
 *  @return UIImage，设置之后得到的UIImage对象
 */
-(UIImage *)mc_resetToSize:(CGSize)size;

/**
 *  将image的透明度设置为alpha
 *
 *  @param alpha CGFloat，image设置的透明度
 *
 *  @return UIImage，设置之后得到的UIImage对象
 */
-(UIImage *)mc_resetToAlpha:(CGFloat)alpha;

/**
 *  将image进行缩放，宽度缩放比例为scaleW，高度缩放比例为scaleH
 *
 *  @param scaleW CGFloat，image宽度缩放比例
 *  @param scaleH CGFloat，image高度缩放比例
 *
 *  @return UIImage，设置之后得到的UIImage对象
 */
-(UIImage *)mc_resetToScaleWidth:(CGFloat)scaleW andScaleHeight:(CGFloat)scaleH;

/**
 *  将image进行宽度和高度的同比例缩放
 *
 *  @param scale CGFloat，image缩放比例
 *
 *  @return UIImage，设置之后得到的UIImage对象
 */
-(UIImage *)mc_resetToScale:(CGFloat)scale;

/**
 *  将image进行宽度缩放
 *
 *  @param scaleW CGFloat，image宽度缩放比例
 *
 *  @return UIImage，设置之后得到的UIImage对象
 */
-(UIImage *)mc_resetToScaleWidth:(CGFloat)scaleW;

/**
 *  将image进行高度缩放
 *
 *  @param scaleH CGFloat，image高度缩放比例
 *
 *  @return UIImage，设置之后得到的UIImage对象
 */
-(UIImage *)mc_resetToScaleHeight:(CGFloat)scaleH;

/**
 *  为image的纹理区域设置颜色
 *
 *  @param color UIColor，为image设置的颜色
 *
 *  @return UIImage，设置之后得到的UIImage对象
 */
-(UIImage *)mc_resetWithColor:(UIColor *)color;

/**
 *  为image的设置遮罩
 *
 *  @param mask UIImage，为image设置的遮罩
 *
 *  @return UIImage，设置之后得到的UIImage对象
 */
-(UIImage*)mc_resetWithMask:(UIImage*)mask;

/**
 *  将image的纹理设置到区域rect，但image的尺寸不变，其他区域为透明
 *
 *  @param rect CGRect，为image纹理设置的新的frame
 *
 *  @return UIImage，设置之后得到的UIImage对象
 */
-(UIImage*)mc_resetToRect:(CGRect)rect;

/**
 *  将image的纹理偏移，但image的尺寸不变，其他区域为透明
 *
 *  @param offset CGPoint，为image纹理设置偏移量
 *
 *  @return UIImage，设置之后得到的UIImage对象
 */
-(UIImage*)mc_resetToOffset:(CGPoint)offset;

/**
 *  裁剪image，根据裁剪区域rect得到新的图片
 *
 *  @param rect CGRect，裁剪区域
 *
 *  @return UIImage，将裁剪区域的纹理返回的UIImage对象
 */
- (UIImage *)mc_clipInRect:(CGRect)rect;

/**
 *  对image做灰阶处理
 *
 *  @return UIImage，灰阶处理后的UIImage对象
 */
-(UIImage *)mc_grayImage;


/**
 图片是否有alpha通道

 @return 如果有返回YES,否则返回NO
 */
- (BOOL)mc_hasAlpha;

/**
 根据color和size绘制一张纯色图片

 @param color 图片的颜色
 @param size 图片的尺寸
 @return 生成的图片
 */
+ (UIImage *)mc_imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 对图片进行高斯模糊
 */
- (UIImage *)mc_applyLightEffect;
- (UIImage *)mc_applyExtraLightEffect;
- (UIImage *)mc_applyDarkEffect;
- (UIImage *)mc_applyTintEffectWithColor:(UIColor *)tintColor;
- (UIImage *)mc_applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(nullable UIImage *)maskImage;

@end

NS_ASSUME_NONNULL_END

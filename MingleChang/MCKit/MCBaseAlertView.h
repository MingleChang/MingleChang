//
//  MCBaseAlertView.h
//  MingleChang
//
//  Created by gongtao on 2019/1/7.
//  Copyright © 2019 mingle. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MCBaseAlertView : UIView
/**
 弹窗level，决定弹窗显示层级
 */
@property (nonatomic, assign)CGFloat level;

/**
 是否唯一弹窗，唯一性按照别名区分
 */
@property (nonatomic, assign)BOOL onlyOne;

/**
 别名，用于决定弹窗唯一性
 */
@property (nonatomic, copy)NSString *alias;

/**
 隐藏，由于业务主动隐藏弹窗，在主动触发显示之前都不会再显示
 */
@property (nonatomic, assign)BOOL isHide;

/**
 是否支持点击空白处关闭弹窗
 */
@property (nonatomic, assign)BOOL tapEmptyClose;

/**
 点击空白处关闭弹窗的回调
 */
@property (nonatomic, copy)void(^tapEmptyCloseBlock)(void);

/**
 显示弹窗
 */
- (void)show;

/**
 隐藏弹窗，只隐藏，不会销毁，仍然有管理器进行管理
 */
- (void)hide;

/**
 关闭弹窗，然后进行销毁
 */
- (void)dismiss;

#pragma mark - Override
/**
 设置弹窗在父视图上的初始化布局，子类通过重写该方法来设置弹窗位置
 
 @param view <#view description#>
 */
- (void)initializeLayoutToSuperView:(UIView *)view;

/**
 弹窗显示出来的动画，如果有动画需要重写该方法，并在动画结束时回调block
 
 @param completion <#completion description#>
 */
- (void)showAnimationCompletion:(nullable void (^)(void))completion;

/**
 弹窗关闭的动画，如果有动画需要重写该方法，并在动画结束时回调block
 
 @param completion <#completion description#>
 */
- (void)dismissAnimationCompletion:(nullable void (^)(void))completion;
@end

@interface MCAlertManager : NSObject

@property (nonatomic, strong)UIView *superView;

@end

NS_ASSUME_NONNULL_END

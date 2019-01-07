//
//  MCBaseAlertView.m
//  MingleChang
//
//  Created by gongtao on 2019/1/7.
//  Copyright © 2019 mingle. All rights reserved.
//

#import "MCBaseAlertView.h"


@interface MCAlertManager : NSObject

@property (nonatomic, strong)UIControl *maskView;
@property (nonatomic, strong)NSMutableArray *alertArray;
@property (nonatomic, weak)MCBaseAlertView *showAlertView;

@end

@implementation MCAlertManager

+ (MCAlertManager *)manager {
    static MCAlertManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MCAlertManager alloc] init];
    });
    return instance;
}

#pragma mark - Public
- (void)showAlertView:(MCBaseAlertView *)view {
    view.isHide = NO;
    if ([self.alertArray containsObject:view]) {
        [self.alertArray removeObject:view];
    }
    if (view.onlyOne && view.alias.length > 0) {
        [self removeSameAliasAlert:view.alias];
    }
    [self insertNewAlerView:view];
    [self showCurrentAlertView];
}
- (void)hideAlertView:(MCBaseAlertView *)view {
    view.isHide = YES;
    [self showCurrentAlertView];
}
- (void)dismissAlertView:(MCBaseAlertView *)view {
    if (![self.alertArray containsObject:view]) {
        return;
    }
    
    [self.alertArray removeObject:view];
    [view dismissAnimationCompletion:^{
        [self showCurrentAlertView];
    }];
}
- (void)removeAlertsAlias:(NSString *)alias {
    for (NSInteger i = self.alertArray.count - 1; i >= 0; i--) {
        MCBaseAlertView *lAlertView = [self.alertArray objectAtIndex:i];
        if (lAlertView.alias.length > 0 && [lAlertView.alias isEqualToString:alias]) {
            [lAlertView removeFromSuperview];
            [self.alertArray removeObject:lAlertView];
        }
    }
    [self showCurrentAlertView];
}
- (void)removeAlertsClass:(Class)aClass {
    for (NSInteger i = self.alertArray.count - 1; i >= 0; i--) {
        MCBaseAlertView *lAlertView = [self.alertArray objectAtIndex:i];
        if ([lAlertView isKindOfClass:aClass]) {
            [lAlertView removeFromSuperview];
            [self.alertArray removeObject:lAlertView];
        }
    }
    [self showCurrentAlertView];
}
#pragma mark - Private

/**
 显示弹窗
 */
- (void)showCurrentAlertView {
    MCBaseAlertView *lCurrentAlertView = nil;
    for (MCBaseAlertView *lAlertView in self.alertArray) {
        if (lAlertView.isHide == NO) {
            lCurrentAlertView = lAlertView;
            break;
        }
    }
    if ([self.showAlertView isEqual:lCurrentAlertView]) {
        return;
    }
    [self.showAlertView removeFromSuperview];
    self.showAlertView = lCurrentAlertView;
    if (self.showAlertView == nil) {
        [self.maskView removeFromSuperview];
        return;
    }
    if (self.maskView.superview == nil) {
        [[UIApplication sharedApplication].keyWindow addSubview:self.maskView];
    }
    [self.maskView addSubview:self.showAlertView];
    [self.showAlertView initializeLayoutToSuperView:self.maskView];
    [self.showAlertView showAnimationCompletion:nil];
}

/**
 根据别名移除弹窗
 
 @param alias <#alias description#>
 */
- (void)removeSameAliasAlert:(NSString *)alias {
    for (NSInteger i = self.alertArray.count - 1; i >= 0; i--) {
        MCBaseAlertView *lAlertView = [self.alertArray objectAtIndex:i];
        if (lAlertView.alias.length > 0 &&[lAlertView.alias isEqualToString:alias]) {
            [self.alertArray removeObject:lAlertView];
        }
    }
}

/**
 插入一个新的弹窗
 
 @param view <#view description#>
 */
- (void)insertNewAlerView:(MCBaseAlertView *)view {
    NSInteger index = 0;
    while (index < self.alertArray.count) {
        MCBaseAlertView *lAlertView = [self.alertArray objectAtIndex:index];
        if (lAlertView.level <= view.level) {
            break;
        }
        index ++;
    }
    [self.alertArray insertObject:view atIndex:index];
}

#pragma mark - Event Response
- (void)maskViewClick:(UIControl *)sender {
    if (self.showAlertView.tapEmptyClose) {
        if (self.showAlertView.tapEmptyCloseBlock) {
            self.showAlertView.tapEmptyCloseBlock();
        }
        [self dismissAlertView:self.showAlertView];
    }
}

#pragma mark - Setter And Getter
- (UIControl *)maskView {
    if (_maskView) {
        return _maskView;
    }
    _maskView = [[UIControl alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [_maskView addTarget:self action:@selector(maskViewClick:) forControlEvents:UIControlEventTouchUpInside];
    return _maskView;
}
- (NSMutableArray *)alertArray {
    if (_alertArray) {
        return _alertArray;
    }
    _alertArray = [NSMutableArray array];
    return _alertArray;
}

@end

@interface MCBaseAlertView ()

@end

@implementation MCBaseAlertView

- (void)dealloc {
#ifdef DEBUG
    NSLog(@"%@ Dealloc", [self class]);
#endif
}
- (void)show {
    [[MCAlertManager manager] showAlertView:self];
}
- (void)hide {
    [[MCAlertManager manager] hideAlertView:self];
}
- (void)dismiss {
    [[MCAlertManager manager] dismissAlertView:self];
}

- (void)initializeLayoutToSuperView:(UIView *)view {
    
}

- (void)showAnimationCompletion:(nullable void (^)(void))completion {
    if (completion) {
        completion();
    }
}
- (void)dismissAnimationCompletion:(nullable void (^)(void))completion {
    if (completion) {
        completion();
    }
}

@end

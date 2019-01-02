//
//  NSObject+MingleChang.m
//  MingleChang
//
//  Created by gongtao on 2019/1/2.
//  Copyright © 2019 mingle. All rights reserved.
//

#import "NSObject+MingleChang.h"
#import <objc/runtime.h>

@implementation NSObject (MingleChang)

+ (NSString *)mc_className {
    return NSStringFromClass([self class]);
}

- (NSString *)mc_className {
    return NSStringFromClass([self class]);
}

+(void)mc_exchangeInstanceOldSelector:(SEL)oldSelector newSelector:(SEL)newSelector{
    Method lOldMethod = class_getInstanceMethod(self, oldSelector);
    Method lNewMethod = class_getInstanceMethod(self, newSelector);
    if (!lOldMethod || !lNewMethod) {
        return;
    }
    class_addMethod(self, oldSelector, class_getMethodImplementation(self, oldSelector), method_getTypeEncoding(lOldMethod));
    class_addMethod(self, newSelector, class_getMethodImplementation(self, newSelector), method_getTypeEncoding(lNewMethod));
    method_exchangeImplementations(lOldMethod, lNewMethod);
}

+(void)mc_exchangeClassOldSelector:(SEL)oldSelector newSelector:(SEL)newSelector{
    Method lOldMethod = class_getClassMethod(self, oldSelector);
    Method lNewMethod = class_getClassMethod(self, newSelector);
    if (!lOldMethod || !lNewMethod) {
        return;
    }
    method_exchangeImplementations(lOldMethod, lNewMethod);
}

@end

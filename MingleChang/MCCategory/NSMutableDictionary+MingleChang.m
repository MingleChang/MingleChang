//
//  NSMutableDictionary+MingleChang.m
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#import "NSMutableDictionary+MingleChang.h"

@implementation NSMutableDictionary (MingleChang)

- (void)mc_setObject:(id)anObject forKey:(id <NSCopying>)aKey {
    if (anObject == nil || aKey == nil) {
        return;
    }
    [self setObject:anObject forKey:aKey];
}

@end

//
//  NSMutableArray+MingleChang.m
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#import "NSMutableArray+MingleChang.h"

@implementation NSMutableArray (MingleChang)

- (void)mc_addObject:(id)anObject {
    if (anObject == nil) {
        return;
    }
    [self addObject:anObject];
}
- (void)mc_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject == nil) {
        return;
    }
    [self insertObject:anObject atIndex:index];
}
- (void)mc_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (anObject == nil) {
        return;
    }
    [self replaceObjectAtIndex:index withObject:anObject];
}

@end

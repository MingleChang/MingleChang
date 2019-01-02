//
//  NSArray+MingleChang.m
//  MingleChang
//
//  Created by gongtao on 2019/1/2.
//  Copyright © 2019 mingle. All rights reserved.
//

#import "NSArray+MingleChang.h"

@implementation NSArray (MingleChang)

- (nullable id)mc_objectAtIndex:(NSUInteger)index {
    if (index < self.count) {
        return [self objectAtIndex:index];
    }else {
        return nil;
    }
}

@end

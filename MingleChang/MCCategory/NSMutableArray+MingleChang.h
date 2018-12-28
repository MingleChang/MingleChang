//
//  NSMutableArray+MingleChang.h
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray<ObjectType> (MingleChang)

/**
 如果anObject是nil将忽略这次操作,不为空将调用`- (void)addObject:(ObjectType)anObject`

 @param anObject 如果anObject是nil将忽略这次操作
 */
- (void)mc_addObject:(ObjectType)anObject;

/**
 如果anObject是nil将忽略这次操作，不为空将调用`- (void)insertObject:(ObjectType)anObject atIndex:(NSUInteger)index`

 @param anObject 如果anObject是nil将忽略这次操作
 @param index <#index description#>
 */
- (void)mc_insertObject:(ObjectType)anObject atIndex:(NSUInteger)index;

/**
 如果anObject是nil将忽略这次操作，不为空将调用`- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(ObjectType)anObject`

 @param index <#index description#>
 @param anObject 如果anObject是nil将忽略这次操作
 */
- (void)mc_replaceObjectAtIndex:(NSUInteger)index withObject:(ObjectType)anObject;

@end

NS_ASSUME_NONNULL_END

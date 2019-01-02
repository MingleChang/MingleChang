//
//  NSArray+MingleChang.h
//  MingleChang
//
//  Created by gongtao on 2019/1/2.
//  Copyright © 2019 mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<ObjectType> (MingleChang)

/**
 如果index大于了Array的长度将返回nil，否则调用`- (ObjectType)objectAtIndex:(NSUInteger)index`

 @param index <#index description#>
 @return <#return value description#>
 */
- (nullable ObjectType)mc_objectAtIndex:(NSUInteger)index;
@end

NS_ASSUME_NONNULL_END

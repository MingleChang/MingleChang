//
//  NSMutableDictionary+MingleChang.h
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary<KeyType, ObjectType> (MingleChang)

/**
 如果anObject或者aKey为nil将忽略这次操作，都不为空将会调用`- (void)setObject:(ObjectType)anObject forKey:(KeyType <NSCopying>)aKey`

 @param anObject <#anObject description#>
 @param aKey <#aKey description#>
 */
- (void)mc_setObject:(ObjectType)anObject forKey:(KeyType <NSCopying>)aKey;

@end

NS_ASSUME_NONNULL_END

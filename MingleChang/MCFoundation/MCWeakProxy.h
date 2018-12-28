//
//  MCWeakProxy.h
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MCWeakProxy : NSProxy
@property (nonatomic, weak, readonly)id target;

- (instancetype)initWithTarget:(id)target;
+ (instancetype)weakProxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END

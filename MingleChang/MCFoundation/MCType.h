//
//  MCType.h
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#ifndef MCType_h
#define MCType_h

#import <UIKit/UIKit.h>

#pragma mark - Block 自定义block
typedef void (^mc_voidBlock)(void);
typedef void (^mc_boolBlock)(BOOL);
typedef void (^mc_integetBlock)(NSInteger);
typedef void (^mc_doubleBlock)(CGFloat);
typedef void (^mc_numberBlock)(NSNumber *);
typedef void (^mc_dataBlock)(NSData *);
typedef void (^mc_stringBlock)(NSString *);
typedef void (^mc_arrayBlock)(NSArray *);
typedef void (^mc_dictionaryBlock)(NSDictionary *);
typedef void (^mc_idBlock)(id);

#endif /* MCType_h */

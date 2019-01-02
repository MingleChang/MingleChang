//
//  NSNumber+MingleChang.m
//  MingleChang
//
//  Created by gongtao on 2019/1/2.
//  Copyright © 2019 mingle. All rights reserved.
//

#import "NSNumber+MingleChang.h"
#import "NSString+MingleChang.h"
@implementation NSNumber (MingleChang)
+ (NSNumber *)mc_numberWithString:(NSString *)string {
    NSString *lString = [[string lowercaseString] mc_trim];
    if (!lString || lString.length == 0) {
        return nil;
    }
    //BOOL number
    static NSDictionary *lDic;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lDic = @{@"true":@(YES),
                 @"yes":@(YES),
                 @"false":@(NO),
                 @"no":@(NO)};
    });
    NSNumber *lNumber = [lDic objectForKey:string];
    if (lNumber) {
        return lNumber;
    }
    
    //Hex number
    NSInteger lSymbol = 0;
    if ([string hasPrefix:@"0x"]) {
        lSymbol = 1;
    }else if ([string hasPrefix:@"-0x"]) {
        lSymbol = -1;
    }
    if (lSymbol != 0) {
        NSScanner *lScanner = [NSScanner scannerWithString:lString];
        unsigned int lNum = -1;
        BOOL lResult = [lScanner scanHexInt:&lNum];
        if (lResult) {
            lNumber = [NSNumber numberWithLong:(long)lNum * lSymbol];
            return lNumber;
        }else {
            return nil;
        }
    }
    
    //Normal number
    NSNumberFormatter *lFormatter = [[NSNumberFormatter alloc] init];
    [lFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    lNumber = [lFormatter numberFromString:lString];
    return lNumber;
}
@end

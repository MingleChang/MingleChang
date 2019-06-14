//
//  NSURL+MingleChang.m
//  MingleChang
//
//  Created by MingleChang on 2019/6/14.
//  Copyright © 2019 mingle. All rights reserved.
//

#import "NSURL+MingleChang.h"
#import "NSString+MingleChang.h"

@implementation NSURL (MingleChang)
+ (NSURL *)mc_URLWithString:(NSString *)URLString {
    NSString *lUrlEncode = [URLString mc_urlEncode];
    NSURL *lURL = [NSURL URLWithString:lUrlEncode];
    return lURL;
}

@end

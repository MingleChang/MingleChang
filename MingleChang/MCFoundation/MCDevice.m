//
//  MCDevice.m
//  MingleChang
//
//  Created by gongtao on 2019/1/3.
//  Copyright © 2019 mingle. All rights reserved.
//

#import "MCDevice.h"
#import <sys/stat.h>
#import <dlfcn.h>
#import <mach-o/dyld.h>

@implementation MCDevice
+ (NSString *)bundleName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
}
+ (NSString *)bundleIdentifier {
    return [[NSBundle mainBundle] bundleIdentifier];
}
+ (NSString *)appVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}
+ (NSString *)buildVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}
+ (BOOL)iPhone {
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
}
+ (BOOL)iPad {
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}
+ (BOOL)isSimulator {
#if TARGET_OS_SIMULATOR
    return YES;
#else
    return NO;
#endif
}

#pragma mark - 越狱和破解
+ (BOOL)isJailbroken {
    if ([self isSimulator]) {
        return NO;
    }
    //检查权限
    NSArray *lPaths = @[@"/Applications/Cydia.app",
                        @"/private/var/lib/apt/",
                        @"/private/var/lib/cydia",
                        @"/private/var/stash",
                        @"/User/Applications/",
                        @"/Library/MobileSubstrate/MobileSubstrate.dylib",
                        @"/bin/bash",
                        @"/usr/sbin/sshd",
                        @"/etc/apt"];
    for (NSString *lPath in lPaths) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:lPath]) {
            return YES;
        }
    }
    FILE *lBash = fopen("/bin/bash", "r");
    if (lBash != NULL) {
        fclose(lBash);
        return YES;
    }
    NSString *lPath = [NSString stringWithFormat:@"/private/%@", [NSUUID UUID].UUIDString];
    if ([@"test" writeToFile:lPath atomically:YES encoding:NSUTF8StringEncoding error:NULL]) {
        [[NSFileManager defaultManager] removeItemAtPath:lPath error:nil];
        return YES;
    }
    //检查Cydia
    struct stat stat_info;
    if (0 == stat("/Applications/Cydia.app", &stat_info)) {
        return YES;
    }
    //检查动态注入
    int ret;
    Dl_info dylib_info;
    int (*func_stat)(const char *, struct stat *) = stat;
    if ((ret = dladdr(func_stat, &dylib_info))) {
        return YES;
    }
    //检查动态库
    uint32_t count = _dyld_image_count();
    for (uint32_t i = 0; i < count; ++i) {
        NSString *name = [[NSString alloc]initWithUTF8String:_dyld_get_image_name(i)];
        if ([name containsString:@"Library/MobileSubstrate/MobileSubstrate.dylib"]) {
            return YES;
        }
    }
    //检查环境变量
    char *env = getenv("DYLD_INSERT_LIBRARIES");
    if(env){
        return YES;
    }
    
    return NO;
}

+ (BOOL)isPirated {
    if ([self isSimulator]) {
        return NO;
    }
    if (getgid() <= 10) {
        return YES;
    }
    if ([[NSBundle mainBundle] objectForInfoDictionaryKey:@"SignerIdentity"]) {
        return YES;
    }
    if (![self _fileExistInMainBundle:@"_CodeSignature"]) {
        return YES;
    }
    return NO;
}

#pragma mark - Private
+ (BOOL)_fileExistInMainBundle:(NSString *)name {
    NSString *lBundlePath = [[NSBundle mainBundle] bundlePath];
    NSString *lPath = [NSString stringWithFormat:@"%@/%@", lBundlePath, name];
    BOOL lResult = [[NSFileManager defaultManager] fileExistsAtPath:lPath];
    return lResult;
}
@end

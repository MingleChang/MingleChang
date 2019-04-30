//
//  MCMacro.h
//  MingleChang
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#ifndef MCMacro_h
#define MCMacro_h


#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif

#define MC_RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]//宏定义颜色获取方法，alpha不可设置，默认为1.0
#define MC_RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]//宏定义颜色获取方法，alpha可设置

//一个像素
#define MC_ONE_PIXEL [MCDevice onePixel]

//设备screen尺寸信息
#define MC_SCREEN_BOUNDS [MCDevice screenBounds]
#define MC_SCREEN_SIZE [MCDevice screenSize]
#define MC_SCREEN_WIDTH [MCDevice screenWidth]
#define MC_SCREEN_HEIGHT [MCDevice screenHeight]

#define MC_LOCK(x) dispatch_semaphore_wait(x, DISPATCH_TIME_FOREVER);
#define MC_UNLOCK(x) dispatch_semaphore_signal(x);

#define MC_DISPATCH_MAIN_SYNC_SAFE(block)\
if ([NSThread isMainThread]) {\
block();\
}else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

#define MC_DISPATCH_MAIN_ASYNC_SAFE(block)\
if ([NSThread isMainThread]) {\
block();\
}else {\
dispatch_async(dispatch_get_main_queue(), block);\
}

#define MC_WEAK(x) __weak __typeof__(x) __weak_##x##__ = x;
#define MC_STRONG(x) __strong __typeof__(x) x = __weak_##x##__;

#endif /* MCMacro_h */

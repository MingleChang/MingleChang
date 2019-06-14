//
//  MCDatePickerView.h
//  MingleChang
//
//  Created by MingleChang on 2019/6/14.
//  Copyright © 2019 mingle. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_OPTIONS(NSUInteger, MCDatePickerType) {
    MCDatePickerTypeYear   = (1 << 0),
    MCDatePickerTypeMonth  = (1 << 1),
    MCDatePickerTypeDay    = (1 << 2),
    MCDatePickerTypeHour   = (1 << 3),
    MCDatePickerTypeMinute = (1 << 4),
    MCDatePickerTypeSecond = (1 << 5),
};
@interface MCDatePickerView : UIView
@property (nonatomic, assign)MCDatePickerType type;
@property (nonatomic, strong)NSDate *date;
@end

NS_ASSUME_NONNULL_END

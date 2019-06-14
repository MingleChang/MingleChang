//
//  MCDatePickerView.m
//  MingleChang
//
//  Created by MingleChang on 2019/6/14.
//  Copyright © 2019 mingle. All rights reserved.
//

#import "MCDatePickerView.h"
#import "MCDate.h"
#import "UIColor+MingleChang.h"

#define MIN_YEAR 2000
#define MAX_YEAR 2100

@interface MCDatePickerView () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong)UIPickerView *pickerView;
@property (nonatomic, strong)MCDate *selectedDate;

@property (nonatomic, copy)NSArray *types;

@end
@implementation MCDatePickerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _type = MCDatePickerTypeYear | MCDatePickerTypeMonth | MCDatePickerTypeDay | MCDatePickerTypeHour | MCDatePickerTypeMinute | MCDatePickerTypeSecond;
        [self resetTypes];
        [self configure];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.pickerView.frame = self.bounds;
}
#pragma mark - Private
- (void)resetAllComponents {
    [self resetComponentWithType:MCDatePickerTypeYear];
    [self resetComponentWithType:MCDatePickerTypeMonth];
    [self resetComponentWithType:MCDatePickerTypeDay];
    [self resetComponentWithType:MCDatePickerTypeHour];
    [self resetComponentWithType:MCDatePickerTypeMinute];
    [self resetComponentWithType:MCDatePickerTypeSecond];
}
- (void)resetTypes {
    NSMutableArray *lArray = [NSMutableArray array];
    if (self.type & MCDatePickerTypeYear) {
        [lArray addObject:@(MCDatePickerTypeYear)];
    }
    if (self.type & MCDatePickerTypeMonth) {
        [lArray addObject:@(MCDatePickerTypeMonth)];
    }
    if (self.type & MCDatePickerTypeDay) {
        [lArray addObject:@(MCDatePickerTypeDay)];
    }
    if (self.type & MCDatePickerTypeHour) {
        [lArray addObject:@(MCDatePickerTypeHour)];
    }
    if (self.type & MCDatePickerTypeMinute) {
        [lArray addObject:@(MCDatePickerTypeMinute)];
    }
    if (self.type & MCDatePickerTypeSecond) {
        [lArray addObject:@(MCDatePickerTypeSecond)];
    }
    self.types = lArray;
}
- (NSInteger)numberOfRowWithType:(MCDatePickerType)type {
    switch (type) {
        case MCDatePickerTypeYear:{
            return MAX_YEAR - MIN_YEAR;
        }break;
        case MCDatePickerTypeMonth:{
            return 12;
        }break;
        case MCDatePickerTypeDay:{
            return self.selectedDate.daysInMonth;
        }break;
        case MCDatePickerTypeHour:{
            return 24;
        }break;
        case MCDatePickerTypeMinute:
        case MCDatePickerTypeSecond:{
            return 60;
        }break;
        default:{
            return 0;
        }break;
    }
}
- (NSString *)titleForRow:(NSInteger)row type:(MCDatePickerType)type {
    switch (type) {
        case MCDatePickerTypeYear:{
            return [NSString stringWithFormat:@"%li年", MIN_YEAR + row];
        }break;
        case MCDatePickerTypeMonth:{
            return [NSString stringWithFormat:@"%li月", row + 1];
        }break;
        case MCDatePickerTypeDay:{
            return [NSString stringWithFormat:@"%li日", row + 1];
        }break;
        case MCDatePickerTypeHour:{
            return [NSString stringWithFormat:@"%02li时", row];
        }break;
        case MCDatePickerTypeMinute:{
            return [NSString stringWithFormat:@"%02li分", row];
        }break;
        case MCDatePickerTypeSecond:{
            return [NSString stringWithFormat:@"%02li秒", row];
        }break;
        default:{
            return 0;
        }break;
    }
}
- (NSInteger)componentForType:(MCDatePickerType)type {
    NSNumber *lType = @(type);
    if ([self.types containsObject:lType]) {
        return [self.types indexOfObject:lType];
    }else {
        return -1;
    }
}
- (MCDatePickerType)typeForComponent:(NSInteger)component {
    NSNumber *lNumber = [self.types objectAtIndex:component];
    MCDatePickerType lType = [lNumber unsignedIntegerValue];
    return lType;
}
- (void)resetComponentWithType:(MCDatePickerType)type {
    NSInteger lComponent = [self componentForType:type];
    if (lComponent < 0) {
        return;
    }
    switch (type) {
        case MCDatePickerTypeYear:{
            [self.pickerView selectRow:self.selectedDate.year - MIN_YEAR inComponent:lComponent animated:NO];
        }break;
        case MCDatePickerTypeMonth:{
            [self.pickerView selectRow:self.selectedDate.month - 1 inComponent:lComponent animated:NO];
        }break;
        case MCDatePickerTypeDay:{
            [self.pickerView selectRow:self.selectedDate.day - 1 inComponent:lComponent animated:NO];
        }break;
        case MCDatePickerTypeHour:{
            [self.pickerView selectRow:self.selectedDate.hour inComponent:lComponent animated:NO];
        }break;
        case MCDatePickerTypeMinute:{
            [self.pickerView selectRow:self.selectedDate.minute inComponent:lComponent animated:NO];
        }break;
        case MCDatePickerTypeSecond:{
            [self.pickerView selectRow:self.selectedDate.second inComponent:lComponent animated:NO];
        }break;
        default:{
        }break;
    }
}
- (void)reloadComponentWithType:(MCDatePickerType)type {
    NSInteger lComponent = [self componentForType:type];
    [self.pickerView reloadComponent:lComponent];
}
- (void)selectRow:(NSInteger)row type:(MCDatePickerType)type {
    switch (type) {
        case MCDatePickerTypeYear:{
            self.selectedDate = [self.selectedDate dateByAddYears:row + MIN_YEAR - self.selectedDate.year];
            [self reloadComponentWithType:MCDatePickerTypeDay];
            [self resetComponentWithType:MCDatePickerTypeDay];
        }break;
        case MCDatePickerTypeMonth:{
            self.selectedDate = [self.selectedDate dateByAddMonths:row + 1 - self.selectedDate.month];
            [self reloadComponentWithType:MCDatePickerTypeDay];
            [self resetComponentWithType:MCDatePickerTypeDay];
        }break;
        case MCDatePickerTypeDay:{
            self.selectedDate.day = row + 1;
        }break;
        case MCDatePickerTypeHour:{
            self.selectedDate.hour = row;
        }break;
        case MCDatePickerTypeMinute:{
            self.selectedDate.minute = row;
        }break;
        case MCDatePickerTypeSecond:{
            self.selectedDate.second = row;
        }break;
        default:{
        }break;
    }
}
#pragma mark - Setter And Getter
- (NSDate *)date {
    return self.selectedDate.date;
}
- (void)setDate:(NSDate *)date {
    self.selectedDate = [MCDate dateWithDate:date];
    [self.pickerView reloadAllComponents];
    [self resetAllComponents];
}
- (void)setType:(MCDatePickerType)type {
    if (_type == type || type == 0) {
        return;
    }
    _type = type;
    [self resetTypes];
    [self.pickerView reloadAllComponents];
    [self resetAllComponents];
}
- (MCDate *)selectedDate {
    if (_selectedDate) {
        return _selectedDate;
    }
    _selectedDate = [MCDate date];
    return _selectedDate;
}
#pragma mark - Delegate
#pragma mark - UIPickerView DataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.types.count;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    MCDatePickerType lType = [self typeForComponent:component];
    return [self numberOfRowWithType:lType];
}
#pragma mark - UIPickerView Delegate
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel *lLabel = (UILabel *)view;
    if (lLabel == nil || ![lLabel isKindOfClass:[UILabel class]]) {
        lLabel = [[UILabel alloc] init];
        lLabel.font = [UIFont systemFontOfSize:14];
        lLabel.textColor = [UIColor mc_colorWithHex:0x333333];
        lLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    MCDatePickerType lType = [self typeForComponent:component];
    NSString *lTitle = [self titleForRow:row type:lType];
    lLabel.text = lTitle;
    return lLabel;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    MCDatePickerType lType = [self typeForComponent:component];
    [self selectRow:row type:lType];
}
#pragma mark - Configure
- (void)configure {
    [self configureView];
    [self configureData];
}
- (void)configureView {
    self.pickerView = [[UIPickerView alloc] initWithFrame:self.bounds];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    [self addSubview:self.pickerView];
}
- (void)configureData {
    [self resetAllComponents];
}

@end

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

@interface MCDatePickerView () <UIPickerViewDataSource, UIPickerViewDelegate> {
    MCDate *_selectedDate;
}
@property (nonatomic, strong)UIPickerView *pickerView;
@property (nonatomic, strong)MCDate *selectedDate;

@property (nonatomic, strong)MCDate *minSelectedDate;
@property (nonatomic, strong)MCDate *maxSelectedDate;

@property (nonatomic, copy)NSArray *types;

@property (nonatomic, assign)NSInteger minYear;
@property (nonatomic, assign)NSInteger maxYear;
@property (nonatomic, assign)NSInteger minMonth;
@property (nonatomic, assign)NSInteger maxMonth;
@property (nonatomic, assign)NSInteger minDay;
@property (nonatomic, assign)NSInteger maxDay;
@property (nonatomic, assign)NSInteger minHour;
@property (nonatomic, assign)NSInteger maxHour;
@property (nonatomic, assign)NSInteger minMinute;
@property (nonatomic, assign)NSInteger maxMinute;
@property (nonatomic, assign)NSInteger minSecond;
@property (nonatomic, assign)NSInteger maxSecond;

@end
@implementation MCDatePickerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _type = MCDatePickerTypeYear | MCDatePickerTypeMonth | MCDatePickerTypeDay | MCDatePickerTypeHour | MCDatePickerTypeMinute;
        [self resetTypes];
        [self configure];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.pickerView.frame = self.bounds;
}
#pragma mark - Public
- (void)setDate:(NSDate *)date minDate:(NSDate *)minDate maxDate:(NSDate *)maxDate {
    MCDate *lDate = nil;
    MCDate *lMinDate = nil;
    MCDate *lMaxDate = nil;
    if (date) {
        lDate = [MCDate dateWithDate:date];
    }
    if (minDate) {
        lMinDate = [MCDate dateWithDate:minDate];
    }
    if (maxDate) {
        lMaxDate = [MCDate dateWithDate:maxDate];
    }
    self.minSelectedDate = lMinDate;
    self.maxSelectedDate = lMaxDate;
    self.selectedDate = lDate;
    [self.pickerView reloadAllComponents];
    [self resetAllComponents];
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
            return self.maxYear - self.minYear + 1;
        }break;
        case MCDatePickerTypeMonth:{
            return self.maxMonth - self.minMonth + 1;
        }break;
        case MCDatePickerTypeDay:{
            return self.maxDay - self.minDay + 1;
        }break;
        case MCDatePickerTypeHour:{
            return self.maxHour - self.minHour + 1;
        }break;
        case MCDatePickerTypeMinute: {
            return self.maxMinute - self.minMinute + 1;
        }break;
        case MCDatePickerTypeSecond:{
            return self.maxSecond - self.minSecond + 1;
        }break;
        default:{
            return 0;
        }break;
    }
}
- (NSString *)titleForRow:(NSInteger)row type:(MCDatePickerType)type {
    switch (type) {
        case MCDatePickerTypeYear:{
            return [NSString stringWithFormat:@"%i年", (int)(row + self.minYear)];
        }break;
        case MCDatePickerTypeMonth:{
            return [NSString stringWithFormat:@"%i月", (int)(row + self.minMonth)];
        }break;
        case MCDatePickerTypeDay:{
            return [NSString stringWithFormat:@"%i日", (int)(row + self.minDay)];
        }break;
        case MCDatePickerTypeHour:{
            return [NSString stringWithFormat:@"%02i时", (int)(row + self.minHour)];
        }break;
        case MCDatePickerTypeMinute:{
            return [NSString stringWithFormat:@"%02i分", (int)(row + self.minMinute)];
        }break;
        case MCDatePickerTypeSecond:{
            return [NSString stringWithFormat:@"%02i秒", (int)(row + self.minSecond)];
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
            [self.pickerView selectRow:self.selectedDate.year - self.minYear inComponent:lComponent animated:NO];
        }break;
        case MCDatePickerTypeMonth:{
            [self.pickerView selectRow:self.selectedDate.month - self.minMonth inComponent:lComponent animated:NO];
        }break;
        case MCDatePickerTypeDay:{
            [self.pickerView selectRow:self.selectedDate.day - self.minDay inComponent:lComponent animated:NO];
        }break;
        case MCDatePickerTypeHour:{
            [self.pickerView selectRow:self.selectedDate.hour - self.minHour inComponent:lComponent animated:NO];
        }break;
        case MCDatePickerTypeMinute:{
            [self.pickerView selectRow:self.selectedDate.minute - self.minMinute inComponent:lComponent animated:NO];
        }break;
        case MCDatePickerTypeSecond:{
            [self.pickerView selectRow:self.selectedDate.second - self.minSecond inComponent:lComponent animated:NO];
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
            self.selectedDate = [self.selectedDate dateByAddYears:row + self.minYear - self.selectedDate.year];
            [self reloadComponentWithType:MCDatePickerTypeMonth];
            [self resetComponentWithType:MCDatePickerTypeMonth];
            [self reloadComponentWithType:MCDatePickerTypeDay];
            [self resetComponentWithType:MCDatePickerTypeDay];
        }break;
        case MCDatePickerTypeMonth:{
            self.selectedDate = [self.selectedDate dateByAddMonths:row + self.minMonth - self.selectedDate.month];
            [self reloadComponentWithType:MCDatePickerTypeDay];
            [self resetComponentWithType:MCDatePickerTypeDay];
        }break;
        case MCDatePickerTypeDay:{
            self.selectedDate.day = row + self.minDay;
        }break;
        case MCDatePickerTypeHour:{
            self.selectedDate.hour = row + self.minHour;
        }break;
        case MCDatePickerTypeMinute:{
            self.selectedDate.minute = row + self.minMinute;
        }break;
        case MCDatePickerTypeSecond:{
            self.selectedDate.second = row + self.minSecond;
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
- (NSDate *)minDate {
    return self.minSelectedDate.date;
}
- (void)setMinDate:(NSDate *)minDate {
    self.minSelectedDate = [MCDate dateWithDate:minDate];
    [self.pickerView reloadAllComponents];
    [self resetAllComponents];
}
- (NSDate *)maxDate {
    return self.maxSelectedDate.date;
}
- (void)setMaxDate:(NSDate *)maxDate {
    self.maxSelectedDate = [MCDate dateWithDate:maxDate];
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
    if ([_selectedDate isEarlierThan:self.minSelectedDate]) {
        _selectedDate = [MCDate dateWithYear:self.minSelectedDate.year month:self.minSelectedDate.month day:self.minSelectedDate.day hour:_selectedDate.hour minute:_selectedDate.minute second:_selectedDate.second];
    }else if ([_selectedDate isLaterThan:self.maxSelectedDate]) {
        _selectedDate = [MCDate dateWithYear:self.maxSelectedDate.year month:self.maxSelectedDate.month day:self.maxSelectedDate.day hour:_selectedDate.hour minute:_selectedDate.minute second:_selectedDate.second];
    }
    return _selectedDate;
}
- (void)setSelectedDate:(MCDate *)selectedDate {
    if ([_selectedDate isEqual:selectedDate]) {
        return;
    }
    if ([selectedDate isEarlierThan:self.minSelectedDate]) {
        _selectedDate = [MCDate dateWithYear:self.minSelectedDate.year month:self.minSelectedDate.month day:self.minSelectedDate.day hour:selectedDate.hour minute:selectedDate.minute second:selectedDate.second];
    }else if ([selectedDate isLaterThan:self.maxSelectedDate]) {
        _selectedDate = [MCDate dateWithYear:self.maxSelectedDate.year month:self.maxSelectedDate.month day:self.maxSelectedDate.day hour:selectedDate.hour minute:selectedDate.minute second:selectedDate.second];
    }else {
        _selectedDate = selectedDate;
    }
}
- (MCDate *)minSelectedDate {
    if (_minSelectedDate) {
        return _minSelectedDate;
    }
    _minSelectedDate = [MCDate dateWithYear:2000 month:1 day:1 hour:0 minute:0 second:0];
    return _minSelectedDate;
}
- (MCDate *)maxSelectedDate {
    if (_maxSelectedDate) {
        return _maxSelectedDate;
    }
    _maxSelectedDate = [MCDate dateWithYear:2100 month:12 day:31 hour:23 minute:59 second:59];
    return _maxSelectedDate;
}
- (NSInteger)minYear {
    return self.minSelectedDate.year;
}
- (NSInteger)maxYear {
    return self.maxSelectedDate.year;
}
- (NSInteger)minMonth {
    if ([self.selectedDate isSameYear:self.minSelectedDate]) {
        return self.minSelectedDate.month;
    }else {
        return 1;
    }
}
- (NSInteger)maxMonth {
    if ([self.selectedDate isSameYear:self.maxSelectedDate]) {
        return self.maxSelectedDate.month;
    }else {
        return 12;
    }
}
- (NSInteger)minDay {
    if ([self.selectedDate isSameMonth:self.minSelectedDate]) {
        return self.minSelectedDate.day;
    }else {
        return 1;
    }
}
- (NSInteger)maxDay {
    if ([self.selectedDate isSameMonth:self.maxSelectedDate]) {
        return self.maxSelectedDate.day;
    }else {
        return self.selectedDate.daysInMonth;
    }
}
- (NSInteger)minHour {
    return 0;
}
- (NSInteger)maxHour {
    return 23;
}
- (NSInteger)minMinute {
    return 0;
}
- (NSInteger)maxMinute {
    return 59;
}
- (NSInteger)minSecond {
    return 0;
}
- (NSInteger)maxSecond {
    return 59;
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
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    MCDatePickerType lType = [self typeForComponent:component];
//    return [self titleForRow:row type:lType];
//}
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
    self.pickerView = [[UIPickerView alloc] init];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    [self addSubview:self.pickerView];
}
- (void)configureData {
    [self resetAllComponents];
}

@end

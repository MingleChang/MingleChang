//
//  MCIgnoreAlphaView.m
//  MingleChang
//
//  Created by MingleChang on 16/6/13.
//  Copyright © 2016年 MingleChang. All rights reserved.
//

#import "MCIgnoreAlphaView.h"
#import "UIView+MingleChang.h"

@interface MCIgnoreAlphaView ()

@end

@implementation MCIgnoreAlphaView
#pragma mark - Init
-(instancetype)init{
    self=[super init];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor=[UIColor clearColor];
}

#pragma mark - Override
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    CGFloat alpha=[self mc_alphaOfPoint:point];
//    if (alpha==0) {
//        return nil;
//    }
//    return self;
//}
//-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//    CGFloat alpha=[self mc_alphaOfPoint:point];
//    if (alpha==0) {
//        return NO;
//    }
//    return YES;
//}
@end

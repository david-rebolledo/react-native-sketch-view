//
//  RectangleTrackingSketchTool.m
//  RNSketchView
//
//  Created by NightFury on 06/02/2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "RectangleTrackingSketchTool.h"

@implementation RectangleTrackingSketchTool
-(instancetype)initWithTouchView:(UIView *)touchView
{
    self = [super initWithTouchView:touchView];
    self.path = [UIBezierPath bezierPath];
    return self;
}

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

-(void)clear
{
    [_path removeAllPoints];
}
-(void)touchesBeganWith:(CGPoint)point{
    self.startPoint = point;
}
-(void)touchesMovedWith:(CGPoint)point{
    self.path = [UIBezierPath bezierPathWithRect:
    CGRectMake(_startPoint.x, _startPoint.y, point.x - _startPoint.x, point.y - _startPoint.y)];
}
-(void)touchesEndedWith{
    [self.touchView setNeedsDisplay];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.touchView];
    self.startPoint = point;
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.touchView];
    self.path = [UIBezierPath bezierPathWithRect:
                 CGRectMake(_startPoint.x, _startPoint.y, point.x - _startPoint.x, point.y - _startPoint.y)];
    
    [self.touchView setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.touchView];
    self.path = [UIBezierPath bezierPathWithRect:
    CGRectMake(_startPoint.x, _startPoint.y, point.x - _startPoint.x, point.y - _startPoint.y)];
    [self.touchView setNeedsDisplay];
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}
@end

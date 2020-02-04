//
//  PathTrackingSketchTool.m
//  Sketch
//
//  Created by Keshav on 08/04/17.
//  Copyright © 2017 Particle41. All rights reserved.
//

#import "PathTrackingSketchTool.h"

@implementation PathTrackingSketchTool

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
    [_path moveToPoint:point];
}
-(void)touchesMovedWith:(CGPoint)point{
    [_path addLineToPoint:point];
}
-(void)touchesEndedWith{
    [self.touchView setNeedsDisplay];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.touchView];
    [_path moveToPoint:point];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.touchView];
    [_path addLineToPoint:point];
    [self.touchView setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.touchView];
    [_path addLineToPoint:point];
    [self.touchView setNeedsDisplay];
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}

@end

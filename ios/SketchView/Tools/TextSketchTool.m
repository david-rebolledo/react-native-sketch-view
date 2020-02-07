//
//  TextSketchTool.m
//  RNSketchView
//
//  Created by NightFury on 07/02/2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "TextSketchTool.h"
#import "Paint.h"

@implementation TextSketchTool
{
    Paint *paint;
}

-(instancetype)initWithTouchView:(UIView *)touchView
{
    self = [super initWithTouchView:touchView];
    
    paint = [[Paint alloc] init];
    
    [self setToolColor:[UIColor blackColor]];
    [self setToolThickness:5];
    
    return self;
}

-(void)render
{
    [paint.color setStroke];
}

-(void)setToolThickness:(CGFloat)thickness
{
    paint.thickness = thickness;
    NSLog(@"Real Thickness: %f\n", thickness);
}

-(CGFloat)getToolThickness
{
    return paint.thickness;
}

-(void)setToolColorFromHexString:(NSString *)colorString {
    [self setToolColor:[TextTrackingSketchTool colorFromHexString:colorString]];
     
}
-(void)setToolColor:(UIColor *)color
{
    paint.color = color;
}

-(UIColor *)getToolColor
{
    return paint.color;
}
@end

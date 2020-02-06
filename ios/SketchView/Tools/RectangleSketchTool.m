//
//  RectangleSketchTool.m
//  RNSketchView
//
//  Created by NightFury on 06/02/2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "RectangleSketchTool.h"
#import "Paint.h"

@implementation RectangleSketchTool
{
    Paint *paint;
}

-(instancetype)initWithTouchView:(UIView *)touchView
{
    self = [super initWithTouchView:touchView];
    
    paint = [[Paint alloc] init];
    
    [self setToolColor:[UIColor blackColor]];
    [self setToolThickness:5];
    
    [self.path setLineCapStyle:kCGLineCapRound];
    [self.path setLineJoinStyle:kCGLineJoinRound];
    
    
    return self;
}

-(void)render
{
    [paint.color setStroke];
    [self.path stroke];
}

-(void)setToolThickness:(CGFloat)thickness
{
    paint.thickness = thickness;
    [self.path setLineWidth:paint.thickness];
    NSLog(@"Real Thickness: %f\n", thickness);
}

-(CGFloat)getToolThickness
{
    return paint.thickness;
}

-(void)setToolColorFromHexString:(NSString *)colorString {
    [self setToolColor:[RectangleTrackingSketchTool colorFromHexString:colorString]];
     
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

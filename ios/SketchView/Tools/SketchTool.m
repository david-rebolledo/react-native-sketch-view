//
//  TouchPath.m
//  Sketch
//
//  Created by Keshav on 06/04/17.
//  Copyright © 2017 Particle41. All rights reserved.
//

#import "SketchTool.h"

@implementation SketchTool

-(instancetype)initWithTouchView:(UIView *) touchView
{
    self = [super init];
    self.touchView = touchView;
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self doesNotRecognizeSelector:_cmd];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self doesNotRecognizeSelector:_cmd];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self doesNotRecognizeSelector:_cmd];
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self doesNotRecognizeSelector:_cmd];
}
-(void)touchesBeganWith:(CGPoint)point{
    [self doesNotRecognizeSelector:_cmd];
}
-(void)touchesMovedWith:(CGPoint)point{
    [self doesNotRecognizeSelector:_cmd];
}
-(void)touchesEndedWith{
    [self doesNotRecognizeSelector:_cmd];
}

-(void)render
{
    [self doesNotRecognizeSelector:_cmd];
}

-(void)clear
{
    [self doesNotRecognizeSelector:_cmd];
}

-(void)setToolThickness:(CGFloat)thicknessValue {
    [self doesNotRecognizeSelector:_cmd];
}
@end

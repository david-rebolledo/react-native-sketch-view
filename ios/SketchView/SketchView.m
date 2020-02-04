//
//  SketchView.m
//  Sketch
//
//  Created by Keshav on 06/04/17.
//  Copyright © 2017 Particle41. All rights reserved.
//

#import "SketchView.h"
#import "PenSketchTool.h"
#import "EraserSketchTool.h"

@implementation SketchView
{
    SketchTool *currentTool;
    SketchTool *penTool;
    SketchTool *eraseTool;
    
    UIColor *curSketchColor;
    CGFloat curSketchThickness;
    
    UIImage *incrementalImage;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    [self initialize];
    return self;
}

- (void) initialize
{
    [self setMultipleTouchEnabled:NO];
    curSketchColor = [UIColor blackColor];
    curSketchThickness = 5.0;
    penTool = [[PenSketchTool alloc] initWithTouchView:self];
    eraseTool = [[EraserSketchTool alloc] initWithTouchView:self];
    
    [self setToolType:SketchToolTypePen];
    
    [self setBackgroundColor:[UIColor clearColor]];
    
    
    NSLog(@"\n------Initialize called!------------\n");
}

-(void)setToolType:(SketchToolType) toolType
{
    switch (toolType) {
        case SketchToolTypePen:
            currentTool = penTool;
            break;
        case SketchToolTypeEraser:
            currentTool = eraseTool;
            break;
        default:
            currentTool = penTool;
            break;
    }
    [self setStrokeColorWithCurrent];
    [self setStrokeThicknessWithCurrent];
    
}
-(void)setStrokeColorWithCurrent {
    if ([currentTool respondsToSelector:@selector(setToolColor:)]) {
        [currentTool performSelector:@selector(setToolColor:) withObject:curSketchColor];
    }
}
-(void)setStrokeThicknessWithCurrent {
    if ([currentTool respondsToSelector:@selector(setToolThickness:)]) {
        [currentTool setToolThickness: curSketchThickness];
    }
}
-(void)setStrokeColor:(NSString *)strokeColor {
    curSketchColor = [PathTrackingSketchTool colorFromHexString:strokeColor];
    [self setStrokeColorWithCurrent];
}

-(void)setThickness:(NSUInteger)thicknessValue {
    curSketchThickness = thicknessValue;
    [self setStrokeThicknessWithCurrent];
}

-(void)addDrawObject:(NSDictionary *)drawObject {
//    NSLog(@"DrawObject: %@\n", drawObject);
    NSDictionary *tmp1 = drawObject[@"data"];
    NSString *color = tmp1[@"color"];
    NSArray *arrPoints = tmp1[@"points"];
    NSUInteger thickness = [tmp1[@"thickness"] integerValue];
    NSUInteger type = [tmp1[@"type"] integerValue];
    
    [self setStrokeColor:color];
    [self setThickness:thickness];
    [self setToolType:type];
    
    if (arrPoints.count > 0) {
        CGPoint pt;
        pt.x = [arrPoints[0][@"x"] floatValue];
        pt.y = [arrPoints[0][@"y"] floatValue];
        [currentTool touchesBeganWith:pt];
        
        for(int i=0; i<arrPoints.count; i++){
            pt.x = [arrPoints[i][@"x"] floatValue];
            pt.y = [arrPoints[i][@"y"] floatValue];
            [currentTool touchesMovedWith:pt];
        }
        
        [currentTool touchesEndedWith];
        [self takeSnapshot];
        
    }
}
-(void)setViewImage:(UIImage *)image
{
    incrementalImage = image;
    [self setNeedsDisplay];
}

-(void) clear
{
    incrementalImage = nil;
    [currentTool clear];
    [self setNeedsDisplay];
}

-(void)drawSketch:(NSArray *) arrObjectsP{
    [self clear];
    
    for (int i=0; i < arrObjectsP.count; i++){
        NSDictionary *dict = arrObjectsP[i];
        [self addDrawObject:dict];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [incrementalImage drawInRect:rect];
    [currentTool render];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [currentTool touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [currentTool touchesMoved:touches withEvent:event];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [currentTool touchesEnded:touches withEvent:event];
//    [currentTool clear];//    [self takeSnapshot];
    
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [currentTool touchesCancelled:touches withEvent:event];
//    [currentTool clear];//    [self takeSnapshot];
}

-(void)takeSnapshot
{
    [self setViewImage:[self drawBitmap]];
    [currentTool clear];
}

-(UIImage *)drawBitmap
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
    [self drawRect:self.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}



@end
//
//  TouchPath.h
//  Sketch
//
//  Created by Keshav on 06/04/17.
//  Copyright © 2017 Particle41. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SketchToolType) {
    SketchToolTypePen,
    SketchToolTypeEraser,
    SketchToolTypeRectangle,
    SketchToolTypeCircle
};

@interface SketchTool : NSObject

@property UIView *touchView;

-(instancetype)initWithTouchView:(UIView *) touchView;

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;

-(void)touchesBeganWith:(CGPoint)point;
-(void)touchesMovedWith:(CGPoint)point;
-(void)touchesEndedWith;

-(void)render;
-(void)clear;
-(void)setToolThickness:(CGFloat)thicknessValue;

@end

//
//  RectangleTrackingSketchTool.h
//  RNSketchView
//
//  Created by NightFury on 06/02/2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "SketchTool.h"


@interface RectangleTrackingSketchTool : SketchTool
@property CGPoint *startPoint;
@property UIBezierPath *path;
+ (UIColor *)colorFromHexString:(NSString *)hexString;
@end


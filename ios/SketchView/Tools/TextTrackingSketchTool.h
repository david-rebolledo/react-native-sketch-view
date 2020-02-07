//
//  TextTrackingSketchTool.h
//  RNSketchView
//
//  Created by NightFury on 07/02/2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "SketchTool.h"

@interface TextTrackingSketchTool : SketchTool
@property CGPoint startPoint;
@property NSString text;
+ (UIColor *)colorFromHexString:(NSString *)hexString;
@end


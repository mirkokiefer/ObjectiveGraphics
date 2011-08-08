//
//  LCWedge.h
//  Wire
//
//  Created by Mirko on 7/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LCAbstractShape.h"
@class LCPoint, LCBezierPath;

@interface LCWedge : LCAbstractShape
@property(retain) LCPoint* center;
@property(assign) CGFloat startAngle;
@property(assign) CGFloat angle;
@property(assign) CGFloat radius;

+ (LCWedge*)center:(LCPoint*)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle angle:(CGFloat)angle;

- (LCWedge*)initWithCenter:(LCPoint*)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle angle:(CGFloat)angle;
@end

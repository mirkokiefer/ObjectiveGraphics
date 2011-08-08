//
//  LCWedge.m
//  Wire
//
//  Created by Mirko on 7/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CoreGraphicsWrapper.h"

@interface LCWedge()
@property(retain) LCBezierPath* path;
@end

@implementation LCWedge
@synthesize center, radius, startAngle, angle;
@synthesize path;

+ (LCWedge*)center:(LCPoint*)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle angle:(CGFloat)angle {
  return [[self alloc] initWithCenter:center radius:radius startAngle:startAngle
                        angle:angle];
}

- (LCWedge*)initWithCenter:(LCPoint*)aPoint radius:(CGFloat)radiusVal startAngle:(CGFloat)startAngleVal angle:(CGFloat)angleVal {
  self = [super init];
  if (self) {
    self.center = aPoint;
    self.radius = radiusVal;
    self.startAngle = startAngleVal;
    self.angle = angleVal;
    [self setDrawModeFill];
  }
  return self;
}
@end

@implementation LCWedge(Abstract)

- (id<LCShape>)shape {
  if(self.path) {
    return self.path;
  } else {
    LCBezierPath* newPath = [LCBezierPath path];
    [newPath addArcWithCenter:self.center radius:self.radius startAngle:self.startAngle endAngle:(self.startAngle+self.angle)];
    [newPath addLineToPoint:self.center];
    [newPath closePath];
    self.path = newPath;
    return newPath;
  }
}
@end
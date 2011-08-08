//
//  LCEllipse.m
//  Wire
//
//  Created by Mirko on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CoreGraphicsWrapper.h"

@interface LCEllipse()
@property(retain) LCBezierPath* path;
@end

@implementation LCEllipse
@synthesize rect;
@synthesize path;

+ (LCEllipse*)ellipseWithRect:(LCRect*)aRect {
  return [[LCEllipse alloc] initWithRect:aRect];
}

- (LCEllipse*)initWithRect:(LCRect*)aRect {
  self = [super init];
  if (self) {
    self.rect = aRect;
    [self setDrawModeFill];
  }
  return self;
}
@end

@implementation LCEllipse(Abstract)

- (id<LCShape>)shape {
  if(self.path) {
    return self.path;
  } else {
    self.path = [[LCBezierPath alloc] init];
    [self.path addEllipseInRect:self.rect];
    return self.path;
  }
}
@end
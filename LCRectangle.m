//
//  LCRectangle.m
//  Wire
//
//  Created by Mirko on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ObjectiveGraphics.h"

@interface LCRectangle()
@property(retain) LCBezierPath* path;
@end

@implementation LCRectangle
@synthesize rect;
@synthesize path;

+ (LCRectangle*)rectangleWithRect:(LCRect*)aRect {
  return [[LCRectangle alloc] initWithRect:aRect];
}

- (LCRectangle*)initWithRect:(LCRect*)aRect {
  self = [super init];
  if (self) {
    self.rect = aRect;
  }
  return self;
}
@end

@implementation LCRectangle(Abstract)

- (id<LCShape>)shape {
  if(self.path) {
    return self.path;
  } else {
    self.path = [LCBezierPath path];
    [self.path addRect:self.rect];
    return self.path;
  }
}

@end
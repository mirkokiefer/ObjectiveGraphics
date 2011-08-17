//
//  LCPoint.m
//  Wire
//
//  Created by Mirko on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ObjectiveGraphics.h"

@implementation LCPoint
@synthesize x, y;

+ (LCPoint*)x:(CGFloat)x y:(CGFloat)y {
  return [[LCPoint alloc] initWithX:x y:y];
}

+ (LCPoint*)cPoint:(CGPoint)point {
  return [self x:point.x y:point.y];
}

- (LCPoint*)initWithX:(CGFloat)x1 y:(CGFloat)y1 {
  self = [super init];
  if (self) {
    self.x=x1;
    self.y=y1;
  }
  return self;
}

- (CGPoint)cPoint {
  return CGPointMake(self.x, self.y);
}

- (id)offsetX:(CGFloat)dx y:(CGFloat)dy {
  self.x = x+dx;
  self.y = y+dy;
  return self;
}

@end

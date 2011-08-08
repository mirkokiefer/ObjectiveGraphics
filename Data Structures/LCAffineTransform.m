//
//  LCAffineTransform.m
//  Wire
//
//  Created by Mirko on 7/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CoreGraphicsWrapper.h"

@implementation LCAffineTransform
@synthesize rotate, rotationCenter, translateX, translateY, scaleX, scaleY;

+ (id)affineTransform {
  return [[self alloc] init];
}

+ (id)rotate:(CGFloat)rotate {
  LCAffineTransform* transform = [self affineTransform];
  transform.rotate=rotate;
  return transform;
}

+ (id)translateX:(CGFloat)x y:(CGFloat)y {
  LCAffineTransform* transform = [self affineTransform];
  transform.translateX = x;
  transform.translateY = y;
  return transform;
}

+ (id)scaleX:(CGFloat)x y:(CGFloat)y {
  LCAffineTransform* transform = [self affineTransform];
  transform.scaleX = x;
  transform.scaleY = y;
  return transform;
}

- (id)init {
    self = [super init];
    if (self) {
      self.rotate = 0;
      self.translateX = 0;
      self.translateY = 0;
      self.scaleX = 1;
      self.scaleY = 1;
    }
    
    return self;
}

- (CGAffineTransform)cAffineTransform {
  CGFloat addTX = 0;
  CGFloat addTY = 0;
  if(self.rotationCenter) {
    LCAffineTransform* tempRotate = [LCAffineTransform rotate:self.rotate];
    LCPoint* newPoint = [tempRotate transformPoint:self.rotationCenter];
    addTX = self.rotationCenter.x-newPoint.x;
    addTY = self.rotationCenter.y-newPoint.y;
  }
  CGAffineTransform transform = CGAffineTransformMakeTranslation(self.translateX+addTX, self.translateY+addTY);
  transform = CGAffineTransformScale(transform, self.scaleX, self.scaleY);
  transform = CGAffineTransformRotate(transform, degToRad(self.rotate));
  return transform;
}

- (LCPoint*)transformPoint:(LCPoint*)point {
  return [LCPoint cPoint:CGPointApplyAffineTransform(point.cPoint, self.cAffineTransform)];
}

- (CGPathRef)transformCPath:(CGPathRef)path {
  CGAffineTransform transform = self.cAffineTransform;
  return CGPathCreateCopyByTransformingPath(path, &transform);
}

- (LCBezierPath*)transformPath:(LCBezierPath*)path {
  CGAffineTransform transform = self.cAffineTransform;
  return [LCBezierPath cPath:CGPathCreateCopyByTransformingPath(path.cPath, &transform)];
}
@end

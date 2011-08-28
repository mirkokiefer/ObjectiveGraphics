//
//  LCRect.m
//  Wire
//
//  Created by Mirko on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ObjectiveGraphics.h"

@implementation LCRect
@synthesize bottomLeft, width, height;

+ (id)bottomLeft:(LCPoint*)point width:(CGFloat)width height:(CGFloat)height {
  return [[self alloc] initWithBottomLeft:point width: width height: height];
}

+ (id)x:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height {
  return [self bottomLeft:[LCPoint x:x y:y] width: width height: height];
}

+ (id)rect:(CGRect)rect {
  return [self x:CGRectGetMinX(rect) y:CGRectGetMinY(rect) width:CGRectGetWidth(rect) height:CGRectGetHeight(rect)];
}

- (LCRect*)initWithBottomLeft:(LCPoint*)aPoint width:(CGFloat)widthValue height:(CGFloat)heightValue {
  self = [super init];
  if (self) {
    self.bottomLeft = aPoint;
    self.width = widthValue;
    self.height = heightValue;
  }
  return self;
}

- (CGRect)cRect {
  return CGRectMake(self.bottomLeft.x, self.bottomLeft.y, self.width, self.height);
}

- (CGSize)cSize {
  return CGSizeMake(self.width, self.height);
}

- (LCPoint*)rectCenter {
  return [LCPoint x:self.bottomLeft.x+self.width/2 y:self.bottomLeft.y+self.height/2];
}

- (LCPoint*)leftCenter {
  return [LCPoint x:self.bottomLeft.x y:self.bottomLeft.y+self.height/2];
}

- (LCPoint*)topCenter {
  return [LCPoint x:self.bottomLeft.x+self.width/2 y:self.bottomLeft.y+self.height];
}

- (LCPoint*)rightCenter {
  return [LCPoint x:self.bottomLeft.x+self.width y:self.bottomLeft.y+self.height/2];
}

- (LCPoint*)bottomCenter {
  return [LCPoint x:self.bottomLeft.x+self.width/2 y:self.bottomLeft.y];
}

- (void)setTopLeft:(LCPoint *)topLeft {
  self.bottomLeft.x = topLeft.x;
  self.bottomLeft.y = topLeft.y - self.height;
}

- (void)setTopRight:(LCPoint *)topRight {
  self.bottomLeft.x = topRight.x - self.width;
  self.bottomLeft.y = topRight.y - self.height;
}

- (void)setBottomRight:(LCPoint *)bottomRight {
  self.bottomLeft.x = bottomRight.x - self.width;
  self.bottomLeft.y = bottomRight.y;
}

- (LCPoint *)topLeft {
  return [LCPoint x:self.x y:self.y+self.height];
}

- (LCPoint *)topRight {
  return [LCPoint x:self.x+self.width y:self.y+self.height];
}

- (LCPoint *)bottomRight {
  return [LCPoint x:self.x+self.width y:self.y];
}

- (LCRect*)set:(LCAnchor*)anchor to:(LCPoint*)point {
  return [anchor setPointOn:self to:point];
}

- (LCPoint*)pointAt:(LCAnchor*)anchor {
  return [anchor pointOn:self];
}

- (LCRect*)rectWithPaddingX:(CGFloat)x y:(CGFloat)y {
  return [LCRect x:self.bottomLeft.x - x y:self.bottomLeft.y - y width:self.width+2*x height:self.height+2*x];
}

- (void)setX:(CGFloat)x {
  self.bottomLeft.x = x;
}

- (void)setY:(CGFloat)y {
  self.bottomLeft.y = y;
}

- (CGFloat)x {
  return self.bottomLeft.x;
}

- (CGFloat)y {
  return self.bottomLeft.y;
}

- (LCRect*)scale:(CGFloat)factor {
  return [self scaleWidth:factor height:factor];
}

- (LCRect *)scaleWidth:(CGFloat)widthScaleFactor height:(CGFloat)heightScaleFactor {
  [self offsetFactorX:widthScaleFactor y:heightScaleFactor];
  [self scaleInPositionWidth:widthScaleFactor height:heightScaleFactor];
  return self;
}

- (LCRect*)scaleInPosition:(CGFloat)factor {
  return [self scaleInPositionWidth:factor height:factor];
}

- (LCRect *)scaleInPositionWidth:(CGFloat)widthScaleFactor height:(CGFloat)heightScaleFactor {
  self.width = self.width*widthScaleFactor;
  self.height = self.height*heightScaleFactor;
  return self;
}

- (LCRect *)scaleTopLeftTo:(LCPoint *)point {
  CGFloat widthDiff = point.x - self.topLeft.x;
  CGFloat heightDiff = point.y - self.topLeft.y;
  self.width += -widthDiff;
  self.height += heightDiff;
  self.topLeft = point;
  return self;
}

- (LCRect*)offsetX:(CGFloat)dx y:(CGFloat)dy {
  self.bottomLeft = [self.bottomLeft offsetX:dx y:dy];
  return self;
}

- (LCRect*)offsetFactor:(CGFloat)factor {
  return [self offsetFactorX:factor y:factor];
}

- (LCRect *)offsetFactorX:(CGFloat)xFactor y:(CGFloat)yFactor {
  self.bottomLeft.x = self.bottomLeft.x*xFactor;
  self.bottomLeft.y = self.bottomLeft.y*yFactor;
  return self;
}

@end

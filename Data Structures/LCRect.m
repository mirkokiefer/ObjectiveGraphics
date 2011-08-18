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
  [self offsetFactor:factor];
  [self scaleInPosition:factor];
  return self;
}

- (LCRect*)scaleInPosition:(CGFloat)factor {
  self.width = self.width*factor;
  self.height = self.height*factor;
  return self;
}

- (LCRect*)offsetX:(CGFloat)dx y:(CGFloat)dy {
  self.bottomLeft = [self.bottomLeft offsetX:dx y:dy];
  return self;
}

- (LCRect*)offsetFactor:(CGFloat)factor {
  self.bottomLeft.x = self.bottomLeft.x*factor;
  self.bottomLeft.y = self.bottomLeft.y*factor;
  return self;
}

@end

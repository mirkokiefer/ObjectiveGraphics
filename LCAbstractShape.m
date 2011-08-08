//
//  LCAbstractShape.m
//  Wire
//
//  Created by Mirko on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CoreGraphicsWrapper.h"

@interface LCAbstractShape() 
@property(assign) SEL drawMode;
@property(readonly) id<LCShape> transformedShape;
@end

@implementation LCAbstractShape
@synthesize strokeColour, fillColour, strokeWidth, transform;
@synthesize drawMode;
@dynamic transformedShape;

- (id)init {
    self = [super init];
    if (self) {
      self.drawMode = @selector(setDrawModeFill);
      self.strokeColour = [LCColour black];
      self.fillColour = [LCColour black];
      self.strokeWidth = 1;
      self.transform = [LCAffineTransform rotate:0];
    }
    return self;
}

- (id)drawInContext:(LCGraphicsContext*)context {
  [self.transformedShape drawInContext:context];
  return self;
}

- (id)setDrawModeFill {
  self.drawMode = @selector(setDrawModeFill);
  return self;
}

- (id)setDrawModeStroke {
  self.drawMode = @selector(setDrawModeStroke);
  return self;
}

- (id)setDrawModeStrokeFill {
  self.drawMode = @selector(setDrawModeStrokeFill);
  return self;
}

- (LCRect*)boundingBox {
  return self.transformedShape.boundingBox;
}
@end

@implementation LCAbstractShape(CALayerDelegate)

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
  [self drawInContext:[LCGraphicsContext context:ctx]];
}
@end

@implementation LCAbstractShape(Private)

- (LCAbstractShape*)transformedShape {
  id<LCShape> shape = [[self shape] performSelector:self.drawMode];
  shape.strokeColour = strokeColour;
  shape.fillColour = fillColour;
  shape.strokeWidth = strokeWidth;
  shape.transform = transform;
  return shape;
}
@end
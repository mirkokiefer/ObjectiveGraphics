//
//  LCGraphicsContext.m
//  Wire
//
//  Created by Mirko on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CoreGraphicsWrapper.h"

@implementation LCGraphicsContext
@synthesize cContext;

+ (id)currentContext {
  return [[LCGraphicsContext alloc] init];
}

+ (id)context:(CGContextRef)aContext {
  LCGraphicsContext* context = [[LCGraphicsContext alloc] init];
  context.cContext = aContext;
  return context;
}

- (id)init
{
    self = [super init];
    if (self) {
      cContext = CGContextRetain([[NSGraphicsContext currentContext] graphicsPort]);
      CGContextSetAllowsAntialiasing(cContext, YES);
      CGContextSetShouldAntialias(cContext, YES);
      //context = UIGraphicsGetCurrentContext();
    }
    
    return self;
}

- (void)setFillColour:(LCColour*)colour {
  CGContextSetRGBFillColor(self.cContext, colour.red, colour.green, colour.blue, colour.alpha);
}

- (void)setStrokeColour:(LCColour*)colour {
  CGContextSetRGBStrokeColor(self.cContext, colour.red, colour.green, colour.blue, colour.alpha);
}

- (void)setLineWidth:(CGFloat)width {
  CGContextSetLineWidth(self.cContext, width);
}

- (void)setTextMatrix:(LCAffineTransform*)transform {
  CGContextSetTextMatrix(cContext, transform.cAffineTransform);
}

- (void)addPath:(LCBezierPath*)path {
  CGContextAddPath(self.cContext, path.cPath);
}

- (void)drawPath:(CGPathDrawingMode)mode {
  CGContextDrawPath(self.cContext, mode);
}

- (void)setAffineTransform:(LCAffineTransform*)transform {
  CGContextScaleCTM(self.cContext, transform.scaleX, transform.scaleY);
  CGContextTranslateCTM(self.cContext, transform.translateX, transform.translateY);
  CGContextRotateCTM(self.cContext, transform.rotate);
}
@end

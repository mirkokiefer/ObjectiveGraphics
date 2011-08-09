//
//  LCGraphicsContext.h
//  Wire
//
//  Created by Mirko on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@class LCAffineTransform, LCColour, LCBezierPath;

@interface LCGraphicsContext : NSObject
@property(retain, readonly) __attribute__((NSObject)) CGContextRef cContext;

+ (id)currentContext;

+ (id)context:(CGContextRef)context;

- (void)setFillColour:(LCColour*)colour;

- (void)setStrokeColour:(LCColour*)colour;

- (void)setLineWidth:(CGFloat)width;

- (void)setTextMatrix:(LCAffineTransform*)transform;

- (void)addPath:(LCBezierPath*)path;

- (void)drawPath:(CGPathDrawingMode)mode;

- (void)setAffineTransform:(LCAffineTransform*)transform;
@end

//
//  LCBezierPath.h
//  Wire
//
//  Created by Mirko on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LCShape.h"
@class  LCGraphicsContext, LCPoint, LCRect, LCAffineTransform;

@interface LCBezierPath : NSObject <LCShape>
@property(readonly) CGPathRef cPath;
@property(readonly) LCRect* boundingBox;

+ (LCBezierPath*)path;

+ (LCBezierPath*)cPath:(CGPathRef)path;

- (LCBezierPath*)moveToPoint:(LCPoint*)point;

- (LCBezierPath*)addLineToPoint:(LCPoint*)point;

- (LCBezierPath*)addLineWithPoints:(NSArray*)points;

- (LCBezierPath*)addArcWithCenter:(LCPoint*)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle
       endAngle:(CGFloat)endAngle;

- (LCBezierPath*)addArcWithTangent1:(LCPoint*)tangent1End tangent2:(LCPoint*)tangent2End
                   radius:(CGFloat)radius;

- (LCBezierPath*)addCurveToPoint:(LCPoint*)point controlPoint1:(LCPoint*)cp1 controlPoint2:(LCPoint*)cp2;

- (LCBezierPath*)addRect:(LCRect*)rect;

- (LCBezierPath*)addEllipseInRect:(LCRect*)rect;

- (LCBezierPath*)addPath:(LCBezierPath*)path;

- (LCBezierPath*)closePath;

- (BOOL)containsPoint:(LCPoint*)point;

- (LCBezierPath*)transform:(LCAffineTransform*)m;

- (LCBezierPath*)copyWithTransform:(LCAffineTransform*)m;

- (LCBezierPath*)setDrawModeFill;

- (LCBezierPath*)setDrawModeStroke;

- (LCBezierPath*)setDrawModeStrokeFill;

- (LCBezierPath*)drawInContext:(LCGraphicsContext*)context;
@end
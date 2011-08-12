//
//  LCBezierPath.m
//  Wire
//
//  Created by Mirko on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ObjectiveGraphics.h"

@interface LCBezierPath()
@property(strong)__attribute__((NSObject)) CGMutablePathRef path;
@property(readonly) LCBezierPath* transformedPath;
@property(assign) CGPathDrawingMode mode;
@property(readonly) LCRect* nonTransformedBoundingBox;
@end

@implementation LCBezierPath
@synthesize strokeColour, fillColour, strokeWidth, transform;
@synthesize path, mode;
@dynamic transformedPath, nonTransformedBoundingBox;

+ (LCBezierPath*)path {
  return [[LCBezierPath alloc] init];
}

+ (LCBezierPath*)cPath:(CGPathRef)pathRef {
  LCBezierPath* lcPath = [self path];
  lcPath.path = CGPathCreateMutableCopy(pathRef);
  return lcPath;
}

- (id)init {
    self = [super init];
    if (self) {
      path = CGPathCreateMutable();
      self.mode = kCGPathFill;
      self.strokeColour = [LCColour black];
      self.fillColour = [LCColour black];
      self.strokeWidth = 1;
      self.transform = [LCAffineTransform rotate:0];
    }
    
    return self;
}

- (CGPathRef)cPath {
  return CGPathCreateCopy(path);
}

- (LCBezierPath*)moveToPoint:(LCPoint*)point {
  CGPathMoveToPoint(path, NULL, point.x, point.y);
  return self;
}

- (LCBezierPath*)addLineToPoint:(LCPoint*)point {
  CGPathAddLineToPoint(path, NULL, point.x, point.y);
  return self;
}

- (LCBezierPath*)addLineWithPoints:(NSArray*)points {
  CGPoint cgPoints[[points count]];
  for(int i=0; i<[points count]; i++) {
    cgPoints[i] = [[points objectAtIndex:i] cPoint];
  }
  CGPathAddLines(path, NULL, cgPoints, [points count]);
  return self;
}

- (LCBezierPath*)addArcWithCenter:(LCPoint*)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle
               endAngle:(CGFloat)endAngle {
  CGPathAddArc(path, NULL, center.x, center.y, radius, startAngle*3.14/180, endAngle*3.14/180, NO);
  return self;
}

- (LCBezierPath*)addArcWithTangent1:(LCPoint*)tangent1End tangent2:(LCPoint*)tangent2End
                   radius:(CGFloat)radius {
  CGPathAddArcToPoint(path, NULL, tangent1End.x, tangent1End.y, tangent2End.x, tangent2End.y, radius);
  return self;
}

- (LCBezierPath*)addCurveToPoint:(LCPoint*)point controlPoint1:(LCPoint*)cp1 controlPoint2:(LCPoint*)cp2 {
  CGPathAddCurveToPoint(path, NULL, cp1.x, cp1.y, cp2.x, cp2.y, point.x, point.y);
  return self;
}

- (LCBezierPath*)addRect:(LCRect*)rect {
  CGPathAddRect(path, NULL, rect.cRect);
  return self;
}

- (LCBezierPath*)addEllipseInRect:(LCRect*)rect {
  CGPathAddEllipseInRect(path, NULL, rect.cRect);
  return self;
}

- (LCBezierPath*)addPath:(LCBezierPath*)path2 {
  CGPathAddPath(path, NULL, path2.cPath);
  return self;
}

- (LCBezierPath*)closePath {
  CGPathCloseSubpath(path);
  return self;
}

- (BOOL)containsPoint:(LCPoint*)point {
  return CGPathContainsPoint(path, NULL, point.cPoint, YES);
}

- (LCBezierPath*)transform:(LCAffineTransform*)m {
  self.path = CGPathCreateMutableCopy([m transformCPath:self.path]);
  return self;
}

- (LCBezierPath*)copyWithTransform:(LCAffineTransform*)m {
  return [m transformPath:self];
}

- (LCBezierPath*)setDrawModeFill {
  self.mode = kCGPathFill;
  return self;
}

- (LCBezierPath*)setDrawModeStroke {
  self.mode = kCGPathStroke;
  return self;
}

- (LCBezierPath*)setDrawModeStrokeFill {
  self.mode = kCGPathFillStroke;
  return self;
}

- (LCRect*)boundingBox {
  LCRect* boundingBox = [LCRect rect: CGPathGetBoundingBox(self.transformedPath.cPath)];
  
  return [boundingBox rectWithPaddingX:self.strokeWidth y:self.strokeWidth];;
}

- (LCBezierPath*)drawInContext:(LCGraphicsContext*)context {
  [context setFillColour:fillColour];
  [context setStrokeColour:strokeColour];
  [context setLineWidth:strokeWidth];
  
  [context addPath:self.transformedPath];
  [context drawPath:self.mode];
  return self;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
  [self drawInContext:[LCGraphicsContext context:ctx]];
}
@end

@implementation LCBezierPath(Private)

- (LCBezierPath*)transformedPath {
  self.transform.rotationCenter = self.nonTransformedBoundingBox.rectCenter;
  return [self copyWithTransform:self.transform];
}

- (LCRect*)nonTransformedBoundingBox {
  return [LCRect rect: CGPathGetBoundingBox(self.cPath)];
}
@end

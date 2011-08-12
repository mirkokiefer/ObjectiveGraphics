//
//  LCAffineTransform.h
//  Wire
//
//  Created by Mirko on 7/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCAffineTransform : NSObject
@property(assign) CGFloat rotate;
@property(strong) LCPoint* rotationCenter;
@property(assign) CGFloat translateX;
@property(assign) CGFloat translateY;
@property(assign) CGFloat scaleX;
@property(assign) CGFloat scaleY;
@property(readonly) CGAffineTransform cAffineTransform;

+ (id)affineTransform;

+ (id)rotate:(CGFloat)rotate;

+ (id)translateX:(CGFloat)x y:(CGFloat)y;

+ (id)scaleX:(CGFloat)x y:(CGFloat)y;

- (LCPoint*)transformPoint:(LCPoint*)point;

- (CGPathRef)transformCPath:(CGPathRef)path;

- (LCBezierPath*)transformPath:(LCBezierPath*)path;

@end

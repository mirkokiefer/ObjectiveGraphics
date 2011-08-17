//
//  LCPoint.h
//  Wire
//
//  Created by Mirko on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


@interface LCPoint : NSObject
@property(assign) CGFloat x;
@property(assign) CGFloat y;
@property(readonly) CGPoint cPoint;

+ (LCPoint*)x:(CGFloat)x y:(CGFloat)y;
+ (LCPoint*)cPoint:(CGPoint)point;

- (LCPoint*)initWithX:(CGFloat)x y:(CGFloat)y;
- (id)offsetX:(CGFloat)dx y:(CGFloat)dy;
@end

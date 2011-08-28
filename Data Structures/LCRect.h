//
//  LCRect.h
//  Wire
//
//  Created by Mirko on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@class LCPoint, LCAnchor;

@interface LCRect : NSObject
@property(strong) LCPoint* bottomLeft;
@property(assign) CGFloat width;
@property(assign) CGFloat height;
@property(readonly) CGRect cRect;
@property(readonly) CGSize cSize;
@property(readonly) LCPoint* rectCenter;
@property(readonly) LCPoint* topCenter;
@property(readonly) LCPoint* bottomCenter;
@property(readonly) LCPoint* leftCenter;
@property(readonly) LCPoint* rightCenter;
@property(assign) LCPoint* topLeft;
@property(assign) LCPoint* topRight;
@property(assign) LCPoint* bottomRight;
@property(assign) CGFloat x;
@property(assign) CGFloat y;

+ (id)bottomLeft:(LCPoint*)point width:(CGFloat)width height:(CGFloat)height;
+ (id)x:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;
+ (id)rect:(CGRect)rect;
- (id)initWithBottomLeft:(LCPoint*)point width:(CGFloat)width height:(CGFloat)height;
- (LCPoint*)bottomLeft;
- (CGFloat)width;
- (CGFloat)height;
- (LCRect*)set:(LCAnchor*)anchor to:(LCPoint*)point;
- (LCPoint*)pointAt:(LCAnchor*)anchor;
- (LCRect*)rectWithPaddingX:(CGFloat)x y:(CGFloat)y;
- (LCRect*)scale:(CGFloat)factor;
- (LCRect*)scaleWidth:(CGFloat)widthScaleFactor height:(CGFloat)heightScaleFactor;
- (LCRect*)scaleInPosition:(CGFloat)factor;
- (LCRect*)scaleInPositionWidth:(CGFloat)widthScaleFactor height:(CGFloat)heightScaleFactor;
- (LCRect*)scaleTopLeftTo:(LCPoint*)point;
- (LCRect*)offsetX:(CGFloat)dx y:(CGFloat)dy;
- (LCRect*)offsetFactor:(CGFloat)factor;
- (LCRect*)offsetFactorX:(CGFloat)xFactor y:(CGFloat)yFactor;
@end

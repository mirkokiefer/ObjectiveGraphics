//
//  LCRect.h
//  Wire
//
//  Created by Mirko on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@class LCPoint;

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
@property(assign) CGFloat x;
@property(assign) CGFloat y;

+ (id)bottomLeft:(LCPoint*)point width:(CGFloat)width height:(CGFloat)height;
+ (id)x:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;
+ (id)rect:(CGRect)rect;
- (id)initWithBottomLeft:(LCPoint*)point width:(CGFloat)width height:(CGFloat)height;
- (LCPoint*)bottomLeft;
- (CGFloat)width;
- (CGFloat)height;
- (LCRect*)rectWithPaddingX:(CGFloat)x y:(CGFloat)y;
- (id)scale:(CGFloat)factor;
@end

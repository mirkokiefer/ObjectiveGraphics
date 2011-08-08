//
//  LCShape.h
//  Wire
//
//  Created by Mirko on 7/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LCGraphicsContext, LCColour, LCRect;

@protocol LCShape <NSObject>

@required
@property(retain) LCColour* strokeColour;
@property(retain) LCColour* fillColour;
@property(assign) CGFloat strokeWidth;
@property(retain) LCAffineTransform* transform;
@property(readonly) LCRect* boundingBox;

- (id)drawInContext:(LCGraphicsContext*)context;

//CALayer delegate:
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx;

@optional
- (id)setDrawModeFill;

- (id)setDrawModeStroke;

- (id)setDrawModeStrokeFill;
@end
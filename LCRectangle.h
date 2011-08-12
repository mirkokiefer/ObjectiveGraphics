//
//  LCRectangle.h
//  Wire
//
//  Created by Mirko on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LCAbstractShape.h"
@class LCGraphicsContext, LCBezierPath, LCRect;

@interface LCRectangle : LCAbstractShape
@property(strong) LCRect* rect;

+ (LCRectangle*)rectangleWithRect:(LCRect*)rect;

- (LCRectangle*)initWithRect:(LCRect*)rect;
@end
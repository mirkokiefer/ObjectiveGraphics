//
//  LCColour.h
//  Wire
//
//  Created by Mirko on 7/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


@interface LCColour : NSObject
@property(assign) CGFloat red;
@property(assign) CGFloat green;
@property(assign) CGFloat blue;
@property(assign) CGFloat alpha;
@property(readonly) CGColorRef cColour;

+ (LCColour*)red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

+ (LCColour*)black;

+ (LCColour*)white;

+ (LCColour*)red;

+ (LCColour*)green;

+ (LCColour*)blue;

- (LCColour*)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
@end
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

+ (LCColour*)blue10;
+ (LCColour*)orange10;
+ (LCColour*)green10;
+ (LCColour*)red10;
+ (LCColour*)purple10;
+ (LCColour*)brown10;
+ (LCColour*)violet10;
+ (LCColour*)gray10;
+ (LCColour*)yellowGreen10;
+ (LCColour*)turquoise10;
+ (NSArray*)scheme10;

- (LCColour*)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
@end
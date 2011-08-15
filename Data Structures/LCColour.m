//
//  LCColour.m
//  Wire
//
//  Created by Mirko on 7/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ObjectiveGraphics.h"

@implementation LCColour
@synthesize red, green, blue, alpha;

+ (LCColour*)red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
  return [[self alloc] initWithRed:red green:green blue:blue alpha:alpha];
}

+ (LCColour*)black {
  return [self red:0 green:0 blue:0 alpha:1];
}

+ (LCColour*)white {
  return [self red:1 green:1 blue:1 alpha:1];
}

+ (LCColour*)red {
  return [self red:1 green:0 blue:0 alpha:1];
}

+ (LCColour*)green {
  return [self red:0 green:1 blue:0 alpha:1];
}

+ (LCColour*)blue {
  return [self red:0 green:0 blue:1 alpha:1];
}

+ (LCColour*)blue10 {
  return [self red:0.12 green:0.47 blue:0.71 alpha:1];
}

+ (LCColour*)orange10 {
  return [self red:1 green:0.5 blue:0.06 alpha:1];
}

+ (LCColour*)green10 {
  return [self red:0.17 green:0.63 blue:0.17 alpha:1];
}

+ (LCColour*)red10 {
  return [self red:0.84 green:0.15 blue:0.16 alpha:1];
}

+ (LCColour*)purple10 {
  return [self red:0.58 green:0.4 blue:0.74 alpha:1];
}

+ (LCColour*)brown10 {
  return [self red:0.55 green:0.34 blue:0.29 alpha:1];
}

+ (LCColour*)violet10 {
  return [self red:0.89 green:0.47 blue:0.76 alpha:1];
}

+ (LCColour*)gray10 {
  return [self red:0.5 green:0.5 blue:0.5 alpha:1];
}

+ (LCColour*)yellowGreen10 {
  return [self red:0.74 green:0.74 blue:0.13 alpha:1];
}

+ (LCColour*)turquoise10 {
  return [self red:0.09 green:0.74 blue:0.81 alpha:1];
}

+ (NSArray*)scheme10 {
  return [NSArray arrayWithObjects:[self blue10], [self orange10], [self green10], [self red10],
          [self purple10], [self brown10], [self violet10], [self gray10], [self yellowGreen10], 
          [self turquoise10], nil];
}

- (LCColour*)initWithRed:(CGFloat)redComp green:(CGFloat)greenComp blue:(CGFloat)blueComp alpha:(CGFloat)alphaComp {
  self = [super init];
  if (self) {
    self.red = redComp;
    self.green = greenComp;
    self.blue = blueComp;
    self.alpha = alphaComp;
  }
  return self;
}

- (CGColorRef)cColour {
  return CGColorCreateGenericRGB(self.red, self.green, self.blue, self.alpha);
}
@end

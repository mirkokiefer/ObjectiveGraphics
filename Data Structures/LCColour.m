//
//  LCColour.m
//  Wire
//
//  Created by Mirko on 7/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CoreGraphicsWrapper.h"

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

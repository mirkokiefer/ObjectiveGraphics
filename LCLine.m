//
//  LCLine.m
//  Wire
//
//  Created by Mirko on 7/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ObjectiveGraphics.h"

@interface LCLine()
@property(retain) LCBezierPath* path;
@end

@implementation LCLine
@synthesize path, points;

+ (LCLine*)lineWithPoints:(NSArray*)points {
  return [[LCLine alloc] initWithPoints: points];
}

- (LCLine*)initWithPoints:(NSArray*)pointsArray {
  self = [super init];
  if (self) {
    self.points = [NSMutableArray arrayWithArray: pointsArray];
    [self setDrawModeStroke];
  }
  
  return self;
}

@end

@implementation LCLine(Abstract)

- (id<LCShape>)shape {
  if(self.path) {
    return self.path;
  } else {
    self.path = [LCBezierPath path];
    [self.path addLineWithPoints:self.points];      
    return self.path;
  }
}

@end

//
//  LCArea.m
//  Wire
//
//  Created by Mirko on 7/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ObjectiveGraphics.h"

@interface LCArea()
@property(retain) LCLine* line;
@property(retain) NSArray* topPoints;
@property(retain) NSArray* bottomPoints;
@end

@implementation LCArea
@synthesize line, topPoints, bottomPoints;

+ (id)areaWithTopPoints:(NSArray*)p1 bottomPoints:(NSArray*)p2 {
  return [[self alloc]initWithTopPoints:p1 bottomPoints:p2];
}

- (id)initWithTopPoints:(NSArray*)p1 bottomPoints:(NSArray*)p2 {
  self = [super init];
  if (self) {
    self.topPoints = p1;
    self.bottomPoints = p2;
    [self setDrawModeFill];
  }
  
  return self;
}
@end

@implementation LCArea(Abstract)

- (id<LCShape>)shape {
  if(line) {
    return self.line;
  } else {
    NSMutableArray* points = [NSMutableArray arrayWithArray: self.topPoints];
    [points addObjectsFromArray: [self.bottomPoints reversedArray]];
    [points addObject: [self.topPoints objectAtIndex:0]];
    self.line = [LCLine lineWithPoints:points];
    return self.line;
  }
}
@end
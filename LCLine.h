//
//  LCLine.h
//  Wire
//
//  Created by Mirko on 7/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LCAbstractShape.h"
@class LCPoint;

@interface LCLine : LCAbstractShape
@property(retain) NSMutableArray* points;

+ (LCLine*)lineWithPoints:(NSArray*)points;

- (LCLine*)initWithPoints:(NSArray*)points;
@end

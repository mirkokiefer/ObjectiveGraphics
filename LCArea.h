//
//  LCArea.h
//  Wire
//
//  Created by Mirko on 7/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@class LCBezierPath;

@interface LCArea : LCAbstractShape

+ (id)areaWithTopPoints:(NSArray*)p1 bottomPoints:(NSArray*)p2;

- (id)initWithTopPoints:(NSArray*)p1 bottomPoints:(NSArray*)p2;
@end
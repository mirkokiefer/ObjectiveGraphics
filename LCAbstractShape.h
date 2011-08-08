//
//  LCAbstractShape.h
//  Wire
//
//  Created by Mirko on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LCShape.h"
@class LCBezierPath, LCGraphicsContext;

@interface LCAbstractShape : NSObject <LCShape>

@end

@interface LCAbstractShape(Abstract)

- (id<LCShape>)shape;
@end
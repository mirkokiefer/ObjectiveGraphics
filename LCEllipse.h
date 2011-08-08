//
//  LCEllipse.h
//  Wire
//
//  Created by Mirko on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LCAbstractShape.h"

@interface LCEllipse : LCAbstractShape
@property(retain) LCRect* rect;

+ (LCEllipse*)ellipseWithRect:(LCRect*)rect;

- (LCEllipse*)initWithRect:(LCRect*)rect;
@end
//
//  LCBottomRigthAnchor.m
//  Wire
//
//  Created by Mirko on 8/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DataInk.h"

@implementation LCBottomRight

- (SEL)positionAsGetter {
  return @selector(bottomRight);
}

- (SEL)positionAsSetter {
  return @selector(setBottomRight:);
}

- (LCAnchor *)opposite {
  return [LCTopLeft anchor];
}

@end

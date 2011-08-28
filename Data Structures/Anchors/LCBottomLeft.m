//
//  LCBottomLeftAnchor.m
//  Wire
//
//  Created by Mirko on 8/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DataInk.h"

@implementation LCBottomLeft

- (SEL)positionAsGetter {
  return @selector(bottomLeft);
}

- (SEL)positionAsSetter {
  return @selector(setBottomLeft:);
}

- (LCAnchor *)opposite {
  return [LCTopRight anchor];
}

@end

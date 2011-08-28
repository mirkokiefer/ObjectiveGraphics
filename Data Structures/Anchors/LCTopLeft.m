//
//  LCTopLeftAnchor.m
//  Wire
//
//  Created by Mirko on 8/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DataInk.h"

@interface LCTopLeft()
@end

@implementation LCTopLeft

- (SEL)positionAsGetter {
  return @selector(topLeft);
}

- (SEL)positionAsSetter {
  return @selector(setTopLeft:);
}

- (LCAnchor *)opposite {
  return [LCBottomRight anchor];
}

@end

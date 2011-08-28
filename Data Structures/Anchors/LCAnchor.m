//
//  DIAnchor.m
//  Wire
//
//  Created by Mirko on 8/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DataInk.h"

@implementation LCAnchor
@dynamic positionAsGetter, positionAsSetter, opposite;

+ (id)anchor {
  return [[self alloc] init];
}

- (LCPoint *)pointOn:(LCRect *)rect {
  return [rect performSelector:self.positionAsGetter];
}

- (LCRect *)setPointOn:(LCRect *)rect to:(LCPoint *)point {
  [rect performSelector:self.positionAsSetter withObject:point];
  return rect;
}

- (LCRect *)position:(LCRect *)rect in:(LCRect*)parentRect {
  LCPoint* anchorPoint = [self pointOn:parentRect];
  return [self.opposite setPointOn:rect to:anchorPoint];
}

@end
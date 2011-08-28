//
//  DIAnchor.h
//  Wire
//
//  Created by Mirko on 8/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ObjectiveGraphics.h"

@class DIShape;

@interface LCAnchor : NSObject
@property(readonly) SEL positionAsGetter;
@property(readonly) SEL positionAsSetter;
@property(readonly) LCAnchor* opposite;

- (LCPoint *)pointOn:(LCRect*)rect;
- (LCRect *)setPointOn:(LCRect*)rect to:(LCPoint*)point;
@end

@interface LCAnchor(Abstract)
+ (id)anchor;
- (LCPoint *)pointOn:(LCRect *)rect;
- (LCRect *)position:(LCRect *)rect in:(LCRect*)parentRect;
@end
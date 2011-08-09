
#import "LCShape.h"
@class LCBezierPath, LCGraphicsContext;

@interface LCAbstractShape : NSObject <LCShape>

@end

@interface LCAbstractShape(Abstract)
- (id<LCShape>)shape;
@end
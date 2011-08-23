
#import "LCShape.h"
@class LCBezierPath, LCGraphicsContext;

@interface LCAbstractShape : NSObject <LCShape>
@property(assign) SEL drawMode;
@end

@interface LCAbstractShape(Abstract)
- (id<LCShape>)shape;
@end


@class LCBezierPath;

@interface LCArea : LCAbstractShape

+ (id)areaWithTopPoints:(NSArray*)p1 bottomPoints:(NSArray*)p2;

- (id)initWithTopPoints:(NSArray*)p1 bottomPoints:(NSArray*)p2;
@end
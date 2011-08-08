//
//  LCLable.h
//  Wire
//
//  Created by Mirko on 7/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LCAbstractShape.h"

@interface LCText : NSObject <LCShape>
@property(retain) LCPoint* position;
@property(retain) NSString* text;
@property(assign) CGFloat size;

+ (id)text:(NSString*)text position:(LCPoint*)position size:(CGFloat)size;

- (id)initWithText:(NSString*)aString position:(LCPoint*)aPoint size:(CGFloat)fontSize;
@end
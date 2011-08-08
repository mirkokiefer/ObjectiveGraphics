//
//  LCLable.m
//  Wire
//
//  Created by Mirko on 7/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ObjectiveGraphics.h"

@interface LCText()
@property(assign) CGTextDrawingMode mode;
@end

@implementation LCText
@synthesize strokeColour, fillColour, strokeWidth, transform;
@synthesize position, text, size;
@synthesize mode;


+ (id)text:(NSString*)text position:(LCPoint*)position size:(CGFloat)size {
  return [[self alloc] initWithText:text position:position size:size];
}

- (id)initWithText:(NSString*)aString position:(LCPoint*)aPoint size:(CGFloat)fontSize {
  self = [super init];
  if (self) {
    self.text = aString;
    self.position = aPoint;
    self.size = fontSize;
    self.strokeColour = [LCColour black];
    self.fillColour = [LCColour black];
    self.strokeWidth = 0.5;
    self.transform = [LCAffineTransform rotate:0];
    [self setDrawModeFill];
  }
  
  return self;
}

- (id)drawInContext:(LCGraphicsContext*)context {
  CGContextRef cContext = context.cContext;
  CGContextSelectFont (cContext, "Helvetica-Bold", self.size, kCGEncodingMacRoman);
  CGContextSetTextDrawingMode (cContext, self.mode);
  [context setFillColour: fillColour];
  [context setStrokeColour: strokeColour];
  [context setLineWidth:self.strokeWidth];
  [context setTextMatrix: self.transform];
  
  const char* cText = [text cStringUsingEncoding:NSUTF8StringEncoding];
  CGContextShowTextAtPoint (cContext, position.x, position.y, cText, [text length]);
  return self;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
  [self drawInContext:[LCGraphicsContext context:ctx]];
}

- (LCText*)setDrawModeFill {
  self.mode = kCGTextFill;
  return self;
}

- (LCText*)setDrawModeStroke {
  self.mode = kCGTextStroke;
  return self;
}

- (LCText*)setDrawModeStrokeFill {
  self.mode = kCGTextFillStroke;
  return self;
}

- (LCRect*)boundingBox {
  CGFloat width = self.size*self.text.length*2;
  CGFloat height = self.size*self.text.length*2;
  return [LCRect x:self.position.x-width/2 y:self.position.y-height/2 width:width height:height];
}

@end

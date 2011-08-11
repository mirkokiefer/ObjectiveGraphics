//
//  LCGraphicsExamples.m
//  Wire
//
//  Created by Mirko on 8/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "LCGraphicsExamples.h"
#import "ObjectiveGraphics.h"

@interface LCGraphicsExamples()
@property(strong) NSArray* shapes;
- (void)drawExampleInLayer:(CALayer*)layer;
- (NSArray*)defineShapes;
- (NSArray*)mapShapesToLayers:(NSArray*)shapes;
@end

@implementation LCGraphicsExamples
@synthesize shapes;

+ (id)examplesInLayer:(CALayer *)layer {
  LCGraphicsExamples* newObj = [[self alloc] init];
  [newObj drawExampleInLayer:layer];
  //layer.delegate = self;
  return newObj;
}

- (void)drawExampleInLayer:(CALayer*)drawLayer {
  self.shapes = [self defineShapes];
  NSArray* layers = [self mapShapesToLayers:self.shapes];
  [layers forEach:^(id each) {
    [drawLayer addSublayer:each];
    [each setNeedsDisplay];
  }];
}

- (NSArray*)defineShapes {
  
  NSArray* dataValues = [NSArray arrayWithObjects: [LCPoint x: 300 y:40], [LCPoint x: 320 y:20],
                         [LCPoint x: 340 y:15], [LCPoint x: 360 y:90],
                         [LCPoint x: 380 y:70], [LCPoint x: 400 y:40], nil];
  
  LCRectangle* rectangle = [[LCRectangle rectangleWithRect:[LCRect x:20 y:20 width:240 height:200]] setDrawModeStroke];
  rectangle.strokeWidth = 3;
  
  LCEllipse* ellipse1 = [[LCEllipse ellipseWithRect:[LCRect x:300 y:150 width:100 height:50]] setDrawModeStroke];
  ellipse1.transform = [LCAffineTransform rotate:0];
  LCEllipse* ellipse3 = [[LCEllipse ellipseWithRect:[LCRect x:300 y:150 width:100 height:50]] setDrawModeStroke];
  ellipse3.transform = [LCAffineTransform rotate:90];
  
  LCEllipse* ellipse0 = [[LCEllipse ellipseWithRect:[LCRect x:185 y:185 width:50 height:50]] setDrawModeStroke];
  
  NSArray* points = [NSArray arrayWithObjects: [LCPoint x: 10 y:10], [LCPoint x: 100 y:50],
                     [LCPoint x: 210 y:210], [LCPoint x: 300 y:90], nil];
  LCLine* line = [LCLine lineWithPoints:points];
  
  NSArray* areaBottom = [NSArray arrayWithObjects: [LCPoint x: 300 y:0], [LCPoint x: 320 y:0],
                         [LCPoint x: 340 y:0], [LCPoint x: 360 y:0],
                         [LCPoint x: 380 y:0], [LCPoint x: 400 y:0], nil];
  LCArea* area = [[LCArea areaWithTopPoints:dataValues bottomPoints:areaBottom] setDrawModeStrokeFill];
  area.fillColour = [LCColour red:1 green:1 blue:0 alpha:1];
  area.strokeWidth = 3;
  
  LCWedge* wedge1 = [LCWedge center:[LCPoint x: 450 y:320] radius:100 startAngle:0 angle:240];
  wedge1.fillColour = [LCColour red:0 green:0 blue:1 alpha:1];
  wedge1.strokeWidth = 2;
  [wedge1 setDrawModeStrokeFill];
  LCWedge* wedge2 = [[LCWedge center:[LCPoint x: 450 y:320] radius:80 startAngle:240 angle:120] setDrawModeStrokeFill];
  wedge2.fillColour = [LCColour red:1 green:0 blue:0 alpha:1];
  
  LCText* label1 = [LCText text:@"test" position:[LCPoint x:300 y:200] size:12];
  LCText* label2 = [LCText text:@"Protovis is awesome!" position:[LCPoint x:20 y:230] size:30];
  label2.transform = [LCAffineTransform rotate:30];
  label2.fillColour = [LCColour blue];
  //this doesn't work:
  label1.transform = [LCAffineTransform translateX:10 y:0];
  
  return [NSArray arrayWithObjects: rectangle, line, ellipse0,
          ellipse1, ellipse3, area, wedge1, wedge2, label1, label2, nil];
}

- (NSArray*)mapShapesToLayers:(NSArray*)shapesArray {
  return [shapesArray collect:^(id<LCShape> each) {
    CALayer* shapeLayer = [CALayer layer];
    LCRect* boundingBox = [each boundingBox];
    shapeLayer.bounds = boundingBox.cRect;
    shapeLayer.position = boundingBox.rectCenter.cPoint;
    shapeLayer.delegate = each;
    //shapeLayer.borderWidth = 1;
    return shapeLayer;
  }];
}
@end

@implementation LCGraphicsExamples(Delegate)

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
  NSLog(@"draw layer");
  LCGraphicsContext* context = [LCGraphicsContext context:ctx];
  
  [self.shapes forEach:^(id each) {
    [(LCAbstractShape*)each drawInContext:context];
  }];
}

@end
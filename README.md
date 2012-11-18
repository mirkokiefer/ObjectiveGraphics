#ObjectiveGraphics
An object-oriented, declarative interface to Apple's CoreGraphics library.  
It comes with easy to use shape classes including properties for colour, stroke width and transforms.  

##Examples
Rectangles:
``` objective-c
LCRectangle* rectangle = [[LCRectangle rectangleWithRect:[LCRect x:20 y:20 width:240 height:200]] setDrawModeStroke];
rectangle.strokeWidth = 3;
```

An ellipse with a transform applied to it:
``` objective-c
LCEllipse* ellipse3 = [[LCEllipse ellipseWithRect:[LCRect x:300 y:150 width:100 height:50]] setDrawModeStroke];
ellipse3.transform = [LCAffineTransform rotate:90];
```

Drawing a line along data points:
``` objective-c
NSArray* points = [NSArray arrayWithObjects: [LCPoint x: 10 y:10], [LCPoint x: 100 y:50],
[LCPoint x: 210 y:210], [LCPoint x: 300 y:90], nil];
LCLine* line = [LCLine lineWithPoints:points];
```

An area can be used for charts:
``` objective-c
NSArray* areaBottom = [NSArray arrayWithObjects: [LCPoint x: 300 y:0], [LCPoint x: 320 y:0],
                         [LCPoint x: 340 y:0], [LCPoint x: 360 y:0],
                         [LCPoint x: 380 y:0], [LCPoint x: 400 y:0], nil];
LCArea* area = [[LCArea areaWithTopPoints:dataValues bottomPoints:areaBottom] setDrawModeStrokeFill];
area.fillColour = [LCColour red:1 green:1 blue:0 alpha:1];
area.strokeWidth = 3;
```

Use wedges to construct pie charts:
``` objective-c
LCWedge* wedge1 = [LCWedge center:[LCPoint x: 450 y:320] radius:100 startAngle:0 angle:240];
wedge1.fillColour = [LCColour red:0 green:0 blue:1 alpha:1];
wedge1.strokeWidth = 2;
[wedge1 setDrawModeStrokeFill];
LCWedge* wedge2 = [[LCWedge center:[LCPoint x: 450 y:320] radius:80 startAngle:240 angle:120] setDrawModeStrokeFill];
wedge2.fillColour = [LCColour red:1 green:0 blue:0 alpha:1];
```

And finally draw some transformed text:
``` objective-c
LCText* label2 = [LCText text:@"Protovis is awesome!" position:[LCPoint x:20 y:230] size:30];
label2.transform = [LCAffineTransform rotate:30];
label2.fillColour = [LCColour blue];
```

For a complete working example check out [LCGraphicsExamples.m](https://github.com/mirkok/ObjectiveGraphics/blob/master/LCGraphicsExamples.m).


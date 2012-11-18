#ObjectiveGraphics
An object-oriented interface to Apple's CoreGraphics library.

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


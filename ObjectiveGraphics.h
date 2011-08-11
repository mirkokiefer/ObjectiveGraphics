#include <math.h>
#import <Foundation/Foundation.h>
#import <ApplicationServices/ApplicationServices.h>
#import <AppKit/AppKit.h>
#import <QuartzCore/QuartzCore.h>

#import "CollectionIterators.h"

#import "LCGraphicsContext.h"
#import "LCBezierPath.h"

#import "LCPoint.h"
#import "LCRect.h"
#import "LCColour.h"
#import "LCAffineTransform.h"

#import "LCShape.h"
#import "LCAbstractShape.h"
#import "LCRectangle.h"
#import "LCEllipse.h"
#import "LCLine.h"
#import "LCArea.h"
#import "LCWedge.h"
#import "LCText.h"

#import "LCGraphicsExamples.h"

#define degToRad(x) (M_PI * x / 180.0)
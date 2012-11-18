//
//  PathPoint.m
//  Squares
//
//  Created by Owen Sikes on 11/17/12.
//
//

#import "PathPoint.h"

@implementation PathPoint
@synthesize time;
- (id) init
{
    self = [super init];
    myPoint = CGPointZero;
    return self;
}
- (id) Init:(CGPoint) point{
    myPoint.x = point.x;
    myPoint.y = point.y;
    return self;
}
-(CGPoint)GetPoint{
	return myPoint;
}
- (BOOL)isEqual:(id)anObject
{
    PathPoint * point = (PathPoint*) anObject;
    return CGPointEqualToPoint(myPoint, point->myPoint);
}
@end

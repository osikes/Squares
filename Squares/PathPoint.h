//
//  PathPoint.h
//  Squares
//
//  Created by Owen Sikes on 11/17/12.
//
//

#import <Foundation/Foundation.h>

@interface PathPoint : NSObject
{
	CGPoint myPoint;
	NSTimeInterval time;
}
@property (readwrite) NSTimeInterval time;
-(id) init;
-(id) Init:(CGPoint) point;
-(BOOL)isEqual:(id)anObject;
-(CGPoint)GetPoint;
@end

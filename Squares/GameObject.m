//
//  GameObject.m
//  Squares
//
//  Created by Owen Sikes on 11/16/12.
//
//

#import "GameObject.h"

@implementation GameObject
@synthesize characterType;
-(CGRect)adjustedBoundingBox{
	CGRect currentBox = [self boundingBox];
	return currentBox;
}
@end

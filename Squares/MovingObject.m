//
//  MovingObject.m
//  Squares
//
//  Created by Owen Sikes on 11/15/12.
//
//

#import "MovingObject.h"

@implementation MovingObject
@synthesize down;
@synthesize left;
-(id) init{
    if( self = [super initWithFile:@"Icon-72.png"] ){
    }
    return self;
}
@end

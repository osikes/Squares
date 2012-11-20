//
//  EndPoint.m
//  Squares
//
//  Created by Owen Sikes on 11/17/12.
//
//

#import "EndPoint.h"

@implementation EndPoint
-(id) init{
    if( self = [super initWithFile:@"end.png"] ){
		characterType = endzone;
    }
    return self;
}

@end

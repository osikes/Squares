//
//  BaseLayer.m
//  Squares
//
//  Created by Owen Sikes on 11/19/12.
//
//

#import "BaseLayer.h"

@implementation BaseLayer

@synthesize  hero;
@synthesize pathlines;
@synthesize sprite_objects;
@synthesize end;
@synthesize path;
@synthesize startDate;
@synthesize Score;


-(id)init{
	
	if((self = [super init]))
    {
		path = [[NSMutableArray alloc]init];
		
        hero = [[Hero alloc] initMy];
		
		pathlines = [[NSMutableArray alloc]init];
		
        self.isTouchEnabled = true;
    }
    return self;
}


@end

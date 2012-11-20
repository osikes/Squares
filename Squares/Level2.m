//
//  Level2.m
//  Squares
//
//  Created by Owen Sikes on 11/19/12.
//
//

#import "Level2.h"
#import "GameLayerLevl2.h"
@implementation Level2
-(id)init {
    self = [super init];
    if (self != nil) {
			// Background Layer
			// Gameplay Layer
		GameLayerLevl2 *playlayer = [GameLayerLevl2 node];
		[self addChild:playlayer z:1];
    }
    return self;
}



@end

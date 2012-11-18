//
//  Level1.m
//  Squares
//
//  Created by Owen Sikes on 11/18/12.
//
//

#import "Level1.h"
#import "Grid.h"
#import "BackGroundLvl1.h"
@implementation Level1
-(id)init {
    self = [super init];
    if (self != nil) {
			// Background Layer
        BackGroundLvl1 *backgroundLayer = [BackGroundLvl1 node]; // 1
        [self addChild:backgroundLayer z:0];                       // 2
			// Gameplay Layer
        Grid *gameplayLayer = [Grid node];       // 3
        [self addChild:gameplayLayer z:5];                         // 4
    }
    return self;
}
@end

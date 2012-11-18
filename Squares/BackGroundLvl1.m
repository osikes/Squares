//
//  BackGroundLvl1.m
//  Squares
//
//  Created by Owen Sikes on 11/18/12.
//
//

#import "BackGroundLvl1.h"
#import "cocos2d.h"

@implementation BackGroundLvl1
-(id)init{
	
	if((self = [super init])){
	
		CCSprite* background = [CCSprite spriteWithFile:@"lvl1.png"];
		
		background.anchorPoint = CGPointMake(0, 0);
		
		[self addChild:background];
	}
	return self;
}
@end

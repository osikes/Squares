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
		self.zOrder = -1000;
	CCSprite* background = [CCSprite spriteWithFile:@"lvl1.png"];
		background.anchorPoint = CGPointMake(0, 0);
		background.zOrder = -201;
		
			[self addChild:background z:-1000];
	}
	return self;
}
@end

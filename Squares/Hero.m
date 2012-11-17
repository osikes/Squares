//
//  Hero.m
//  Squares
//
//  Created by Owen Sikes on 11/15/12.
//
//

#import "Hero.h"
#import "MovingObject.h"
#import "cocos2d.h"
#import "CommonProtocol.h"
@implementation Hero

@synthesize characterState;
-(id) initMy{
    if( self = [super initWithFile:@"turtle.png"] ){
    }
    return self;
}



-(void)updateStateWithDeltaTime:(ccTime)deltaTime andListOfGameObjects:(NSMutableArray*)movers
{
	CGRect myBoundingBox = [self adjustedBoundingBox];
   	
	for(MovingObject *object in movers){
		if(CGRectIntersectsRect(myBoundingBox, object.adjustedBoundingBox))
		{
			NSLog(@"intersection");
				if(characterState != kStateDead)
				[self changeState:kStateDead];
		}
		else
			[self changeState:kStateIdle];
	}
}


-(void)changeState:(CharacterStates)newState{

	characterState = newState;
	switch (newState) {
		case kStateDead:
				[self runAction:[CCRepeatForever actionWithAction:[CCRotateTo actionWithDuration:1 angle:720]]];
			break;
		case kStateIdle:
				[self stopAllActions];
			break;
		default:
			break;
	}
}
-(CGRect)adjustedBoundingBox{
	CGRect currentBox = [self boundingBox];
	
	float xcropamount = currentBox.size.width * 0.04;
	float ycropamount = currentBox.size.height * 0.5f;
	
	return  CGRectMake(currentBox.origin.x+xcropamount, currentBox.origin.y+20, currentBox.size.width-xcropamount, currentBox.size.height-ycropamount);
	
	
	
}

@end

//
//  Grid.m
//  Squares
//
//  Created by Owen Sikes on 10/11/12.
//
//
#import <Foundation/Foundation.h>
#import "MainLayerLvl1.h"
#import "Victory.h"
#import "EndPoint.h"
#import "PathPoint.h"
#import "cocos2d.h"
#include <stdlib.h>
#import "GameOver.h"
#import "GameScore.h"
#import "BackGroundLvl1.h"
#import "EndPoint.h"


@implementation MainLayerLvl1



-(void)SetupGrid
{
	sprite_objects = [[NSMutableArray alloc]init];
	
		//[self AddHorizontal:ccp(460,60):true];
	
		//[self AddHorizontal:ccp(460,130):true];
	
		//[self AddHorizontal:ccp(200,180):false];
	
		//[self AddMovable:ccp(180,290):true];
	
		//[self AddMovable:ccp(350,0):false];
	
		//[self AddMovable:ccp(410,300):true];

	[self PlaceEndEntity:ccp(455,180)];
	
    for(int i = 0;i< 8;i++) {
		int x = arc4random()%480;
		int y = arc4random()%320;
		
		if(x < 80)
			x = x+(80-x);
		
		while([self Intersects:ccp(x,y)])
		{
			x = arc4random()%480;
			y = arc4random()%320;
			if(x < 80)
			x = x+(80-x);
			
		}
		[self AddImmoble:ccp(x,y)];
	}
	
}

-(bool)Intersects:(CGPoint) point{
	
		MovingObject *object = [[MovingObject alloc]init];
		object.position = point;
	CGRect currentBox = [end boundingBox ];
	
	 if(CGRectIntersectsRect(currentBox	, object.adjustedBoundingBox))
	 {
		 return true;
	 }
	return false;
}



// on "init" you need to initialize your instance
-(id) init
{
  
    if((self = [super init]))
		
    {
		path = [[NSMutableArray alloc]init];
			
        CGSize winSize = [CCDirector sharedDirector].winSize;
        hero.position = ccp(-50, winSize.height/2);
		
		[self addChild:hero];
		[self SetupGrid];
		
        self.isTouchEnabled = true;
        
        [self scheduleUpdate];
		[self schedule:@selector(MoveMover) interval:.1];
		
		[self PlaceScore:ccp(450,290)];
		
    }
    return self;
}

-(void) MoveMover
{
	for(MovingObject *mover in sprite_objects){
	
		if(mover.characterType == smallmoving){
			float currentY = mover.position.y;
			
			if(currentY>= 280)
				mover.down = true;
			if(currentY<= 20)
				mover.down = false;
			
			if(mover.down)
				currentY = currentY-20;
			else currentY = currentY+20;
			
				
			CCAction *action = [CCMoveTo actionWithDuration:.1 position: CGPointMake(mover.position.x, currentY)];
				
				[mover runAction:action];
		
		}
		else if(mover.characterType == smallimmoble)
		{}
		else if(mover.characterType == smallmoving_horiztonal){
			float currentX = mover.position.x
			;
			
			if(currentX>= 460)
				mover.left = true;
			if(currentX<= 90)
				mover.left= false;
			
			if(mover.left)
				currentX = currentX-20;
			else currentX = currentX+20;
			
			
			CCAction *action = [CCMoveTo actionWithDuration:.1 position: CGPointMake(currentX,mover.position.y)];
			
			[mover runAction:action];
	
		}
	}
}

-(void)RunPoints
{
	int pat_x1,pat_y1;
	
    NSMutableArray *moveActions = [NSMutableArray arrayWithCapacity:[path count]];
	
    int i = 0;
    
	for(PathPoint *point in path)
	{
		pat_x1 = [point GetPoint].x;
		pat_y1= [point GetPoint].y;
		[moveActions addObject:[CCMoveTo actionWithDuration:point.time position:CGPointMake((float) pat_x1, (float) pat_y1)]];
		i++;
	}

    [hero runAction:[CCSequence actionsWithArray:moveActions]];
	
	[path removeAllObjects];
}


-(void) registerWithTouchDispatcher{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:INT_MIN+1 swallowsTouches:YES];
}

-(BOOL)selectSpriteForTouch:(CGPoint)touchLocation
{
    return CGRectContainsPoint(hero.boundingBox, touchLocation);
}


- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
	 self.startDate = [NSDate date];
	
	return touchLocation.x< 70;
}
-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
	
	
		[self RunPoints];
	
}
- (void)panForTranslation:(CGPoint)translation {
    if (hero) {
        CGPoint newPos = ccpAdd(hero.position, translation);
        hero.position = newPos;
    }
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
   CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
	
	/*if(touchLocation.x > 60)
		turtle.position = touchLocation;
*/
    
	PathPoint *point = [[PathPoint alloc]Init:touchLocation];
	

	
	NSDate *touchesEndDate = [NSDate date];
	NSTimeInterval ti = [touchesEndDate timeIntervalSinceDate:self.startDate ];
	point.time = ti;
	[path addObject:point];
	
	self.startDate = [NSDate date];
    
}








@end

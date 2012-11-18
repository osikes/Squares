//
//  Grid.m
//  Squares
//
//  Created by Owen Sikes on 10/11/12.
//
//

#import "Grid.h"
#import "Victory.h"
#import "EndPoint.h"
#import "PathPoint.h"

#import "cocos2d.h"
#import "GameOver.h"
@implementation Grid
@synthesize  turtle;

@synthesize movers;
@synthesize path;
@synthesize startDate;
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Grid *layer = [Grid node];
	
	
	
	// add layer as a child to scene
	[scene addChild: layer];

	// return the scene
	return scene;
}
- (void) update:(ccTime) time {
  
	
[turtle updateStateWithDeltaTime:time andListOfGameObjects:movers ];
	if(turtle.characterState == kStateVictory){
		
        [[CCDirector sharedDirector] replaceScene:[Victory scene]];
    }
    
    
    if(turtle.characterState == kStateDead)
    {   
        [[CCDirector sharedDirector]replaceScene:[GameOver scene]];
    }
    
	}

-(void)SetupGrid{
	 CGSize winSize = [CCDirector sharedDirector].winSize;
	movers = [[NSMutableArray alloc]init];
	
	//[self AddHorizontal:ccp(460,60):true];
	
		//	[self AddHorizontal:ccp(460,130):true];
	
		//[self AddHorizontal:ccp(200,180):false];
	
	[self AddMovable:ccp(180,290):true];
	
		//[self AddMovable:ccp(350,0):false];
	
	[self AddMovable:ccp(410,300):true];
	
		//	[self AddImmoble:ccp(218,290)];
	
	 	[self AddImmoble:ccp(320,25)];

	[self PlaceEndEntity:ccp(455,180)];
}


-(void)PlaceEndEntity:(CGPoint)point{
	EndPoint *end = [[EndPoint alloc]init];
	end.position = point;
	[movers addObject:end];
	[self addChild:end];
	
}

-(void)AddHorizontal:(CGPoint)point:(bool)left{
	MovingObject *object = [[MovingObject alloc]init];
	object.characterType = smallmoving_horiztonal;
	object.left = left;
	object.position = point;
	
	[movers addObject:object];
	[self addChild:object z:5];
}

-(void)AddMovable:(CGPoint)point:(bool)down{
	
	MovingObject *object = [[MovingObject alloc]init];
	object.characterType = smallmoving;
	object.down = down;
	object.position = point;
	
	[movers addObject:object];
	[self addChild:object z:5];
}

-(void)AddImmoble:(CGPoint)point
{
	MovingObject *object = [[MovingObject alloc]init];
	object.characterType = smallimmoble;
	
	object.position = point;
	
	[movers addObject:object];
	[self addChild:object z:5];
}

// on "init" you need to initialize your instance
-(id) init
{
  
    if((self = [super init]))
		
    {
		path = [[NSMutableArray alloc]init];
		CCSprite* background = [CCSprite spriteWithFile:@"lvl1.png"];
		background.tag = 1;
		background.anchorPoint = CGPointMake(0, 0);
		[self addChild:background];
        CGSize winSize = [CCDirector sharedDirector].winSize;
        turtle = [[Hero alloc] initMy];
        turtle.position = ccp(-50, winSize.height/2);
		
			//[sceneSpriteBatchNode addChild:turtle z:500 tag:123213];
		[self addChild:turtle];
		[self SetupGrid];
		
		
		ccColor4B myColor = ccc4(255, 255, 255, 150);
		
		CCRibbon *ribbon = [CCRibbon ribbonWithWidth:10 image:@"green.png" length:10.0 color:myColor fade:0.7f];
		[self addChild:ribbon z:8];
		
        self.isTouchEnabled = true;
        [self scheduleUpdate];
		[self schedule:@selector(MoveMover) interval:.1];
			//[self addChild:sceneSpriteBatchNode z:0];
    }
    return self;
}

-(void) MoveMover
{
	for(MovingObject *mover in movers){
	
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

-(void)RunPoints{
	
	
	int pat_x1,pat_y1;
	NSMutableArray *moveActions = [NSMutableArray arrayWithCapacity:[path count]];
	CCAction *moveSequence = nil;
	for(PathPoint *point in path)
	{
		pat_x1 = [point GetPoint].x;
		pat_y1= [point GetPoint].y;
		NSLog(@"%f time",point.time);
		[moveActions addObject:[CCMoveTo actionWithDuration:point.time position:CGPointMake((float) pat_x1, (float) pat_y1)]];

		
	}
[turtle runAction:[CCSequence actionsWithArray:moveActions]];
	
	[path removeAllObjects];
}




-(void) registerWithTouchDispatcher{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:INT_MIN+1 swallowsTouches:YES];
}

-(BOOL)selectSpriteForTouch:(CGPoint)touchLocation
{
    return CGRectContainsPoint(turtle.boundingBox, touchLocation);
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
    if (turtle) {
        CGPoint newPos = ccpAdd(turtle.position, translation);
        turtle.position = newPos;
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

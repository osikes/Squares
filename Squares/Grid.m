//
//  Grid.m
//  Squares
//
//  Created by Owen Sikes on 10/11/12.
//
//

#import "Grid.h"
#import "Victory.h"
#import "GameOver.h"
@implementation Grid
@synthesize  turtle;

@synthesize movers;
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
  
	if(turtle.position.x >= 460){
        [[CCDirector sharedDirector] replaceScene:[Victory scene]];
    }
    
    
    if(turtle.characterState == kStateDead)
    {   NSLog(@"dead");
        [[CCDirector sharedDirector]replaceScene:[GameOver scene]];
    }
    
	[turtle updateStateWithDeltaTime:time andListOfGameObjects:movers ];
}

-(void)SetupGrid{
	 CGSize winSize = [CCDirector sharedDirector].winSize;
	movers = [[NSMutableArray alloc]init];
	
	
	[self AddHorizontal:ccp(460,60):true];
	
	[self AddHorizontal:ccp(460,130):true];
	
	[self AddHorizontal:ccp(200,180):false];
	
	[self AddMovable:ccp(180,290):true];
	
	[self AddMovable:ccp(350,0):false];
	
	[self AddMovable:ccp(410,300):true];
	
		//add more immoble
	[self AddImmoble:ccp(218,290)];
	
	[self AddImmoble:ccp(320,25)];
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
		NSLog(@"init");
        CGSize winSize = [CCDirector sharedDirector].winSize;
        turtle = [[Hero alloc] initMy];
        turtle.position = ccp(50, winSize.height/2);
		
			//[sceneSpriteBatchNode addChild:turtle z:500 tag:123213];
		[self addChild:turtle];
		[self SetupGrid];
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
			if(currentX<= 20)
				mover.left= false;
			
			if(mover.left)
				currentX = currentX-20;
			else currentX = currentX+20;
			
			
			CCAction *action = [CCMoveTo actionWithDuration:.1 position: CGPointMake(currentX,mover.position.y)];
			
			[mover runAction:action];
	
		}
	}
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
		return [self selectSpriteForTouch:touchLocation];
	
}


- (void)panForTranslation:(CGPoint)translation {
    if (turtle) {
        CGPoint newPos = ccpAdd(turtle.position, translation);
        turtle.position = newPos;
    }
   }

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
		 [self panForTranslation:translation];
}








@end

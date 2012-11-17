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
	int j = 0;
	for(int i = 2; i<5;i++){
		j = i;
		if(i%2 == 0) j = j*-1;
		MovingObject *object = [[MovingObject alloc]init];
		if(i >=4)
			
		object.position = ccp((winSize.width/2)+(i*50.0),(winSize.height/2));
		else
		object.position = ccp((winSize.width/2)+(i*50.0),(winSize.height/2)+(j*250));
		[movers addObject:object ];
		
		[self addChild:object z:5 tag:i];
	}
}

// on "init" you need to initialize your instance
-(id) init
{
  
    if((self = [super init]))
    {
        CGSize winSize = [CCDirector sharedDirector].winSize;
        turtle = [[Hero alloc] initMy];
        turtle.position = ccp(winSize.width/2, winSize.height/2);
		
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
	float currentY = mover.position.y;
	
	if(currentY>= 280)
		mover.down = true;
	if(currentY<= 72)
		mover.down = false;
	
	if(mover.down)
		currentY = currentY-20;
	else currentY = currentY+20;
	
		
	CCAction *action = [CCMoveTo actionWithDuration:.1 position: CGPointMake(mover.position.x, currentY)];
		if(mover.tag < 4)
		[mover runAction:action];
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

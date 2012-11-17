//
//  Grid.m
//  Squares
//
//  Created by Owen Sikes on 10/11/12.
//
//

#import "Grid.h"

@implementation Grid
@synthesize  turtle;


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
   [turtle update];

}
// on "init" you need to initialize your instance
-(id) init
{
  
    if((self = [super init]))
    {
        CGSize winSize = [CCDirector sharedDirector].winSize;
        turtle = [[Hero alloc] initMy];
        turtle.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:turtle];
        self.isTouchEnabled = true;
        [self scheduleUpdate];
    }
    return self;
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

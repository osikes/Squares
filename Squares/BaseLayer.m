//
//  BaseLayer.m
//  Squares
//
//  Created by Owen Sikes on 11/19/12.
//
//

#import "BaseLayer.h"
#import "PathPoint.h"
#import "Victory.h"
#import "GameOver.h"
#import "cocos2d.h"
@implementation BaseLayer

@synthesize  hero;
@synthesize pathlines;
@synthesize sprite_objects;
@synthesize end;
@synthesize path;
@synthesize startDate;
@synthesize Score;


-(void)draw
{
	[super draw];
	glColor4ub(255,0,255,255);
	
		// draw line from a vector to other vector.
    glLineWidth(8.0);
    if ([path count]>2) {
        for(int i = 0;i<[path count];i+=2){
            
        if(i+2 <= [path count]){
           
             PathPoint *firstpoint = [path objectAtIndex:i];
            
            PathPoint *secondpoint = [path objectAtIndex:(i+1)];
           
            CGPoint originPoint = firstpoint.GetPoint;
            CGPoint destinatonPoint = secondpoint.GetPoint;
            ccDrawLine(originPoint, destinatonPoint);
			
			
		if(i >= Score.Score)
			[Score updateValue:i];
			
            
            }
        }
    }
  
}


-(void)PlaceScore:(CGPoint)point{
    
	Score = [[GameScore alloc]init];
    // position the label on the center of the screen
		//label.anchorPoint = CGPointMake(200, 100);
	[Score scorelbl].position = point;
	[self addChild:[Score scorelbl]z:6];
	
	
}
-(void)PlaceEndEntity:(CGPoint)point{
	 end = [[EndPoint alloc]init];
	end.position = point;
	[sprite_objects addObject:end];
	[self addChild:end];
	
}

-(void)AddHorizontal:(CGPoint)point:(bool)left{
	MovingObject *object = [[MovingObject alloc]init];
	object.characterType = smallmoving_horiztonal;
	object.left = left;
	object.position = point;
	
	[sprite_objects addObject:object];
	[self addChild:object z:5];
}

-(void)AddMovable:(CGPoint)point:(bool)down{
	
	MovingObject *object = [[MovingObject alloc]init];
	object.characterType = smallmoving;
	object.down = down;
	object.position = point;
	
	[sprite_objects addObject:object];
	[self addChild:object z:5];
}

-(void)AddImmoble:(CGPoint)point
{
	MovingObject *object = [[MovingObject alloc]init];
	object.characterType = smallimmoble;
	
	object.position = point;
	
	[sprite_objects addObject:object];
	[self addChild:object z:5];
}

-(void) update:(ccTime) time {
    
	
    [hero updateStateWithDeltaTime:time andListOfGameObjects:sprite_objects ];
	if(hero.characterState == kStateVictory){
		
        [[CCDirector sharedDirector] replaceScene:[Victory scene]];
    }
    
    if(hero.characterState == kStateDead)
    {
        [[CCDirector sharedDirector]replaceScene:[GameOver scene]];
    }
}

-(void)SetupGrid
{
    
}

-(id)init{
	
	if((self = [super init]))
    {
		path = [[NSMutableArray alloc]init];
		
        hero = [[Hero alloc] initMy];
		
		pathlines = [[NSMutableArray alloc]init];
		
        self.isTouchEnabled = true;
    }
    return self;
}


@end

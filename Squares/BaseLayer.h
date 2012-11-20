//
//  BaseLayer.h
//  Squares
//
//  Created by Owen Sikes on 11/19/12.
//
//

#import "CCLayer.h"

#import "Hero.h"
#import "GameScore.h"
#import "EndPoint.h"
#import "MovingObject.h"
@interface BaseLayer : CCLayer
{
	NSDate *startDate;
	Hero *hero;
	
EndPoint *end;
NSMutableArray *sprite_objects;
NSMutableArray *pathlines;
	NSMutableArray *path;
GameScore *Score;
}

@property (nonatomic, copy) NSDate *startDate;
@property  (nonatomic,copy) Hero *hero;

@property (nonatomic,copy) EndPoint *end;

@property (nonatomic,copy) NSMutableArray *sprite_objects;
@property (nonatomic,copy) NSMutableArray *path;
@property (nonatomic,copy) NSMutableArray *pathlines;

@property (assign) GameScore *Score;



@end

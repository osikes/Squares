//
//  Grid.h
//  Squares
//
//  Created by Owen Sikes on 10/11/12.
//
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "Hero.h"
#import "MovingObject.h"
@interface Grid : CCLayer
{

CCSpriteBatchNode *sceneSpriteBatchNode;
	NSDate *startDate;
}
+(CCScene *) scene;
@property (nonatomic, copy) NSDate *startDate;
@property  Hero *turtle;
-(void) MoveMover;
@property NSMutableArray *movers;
@property NSMutableArray *path;
@end

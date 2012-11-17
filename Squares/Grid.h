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
}
+(CCScene *) scene;

@property  Hero *turtle;
-(void) MoveMover;
@property NSMutableArray *movers;
@end

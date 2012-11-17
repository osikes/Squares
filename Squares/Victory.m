//
//  Victory.m
//  Squares
//
//  Created by Owen Sikes on 11/16/12.
//
//

#import "Victory.h"
@implementation Victory
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Victory *layer = [Victory node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
-(id)init{
    if( (self=[super init]) ) {
    // create and initialize a Label
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"VICTORY !!!!" fontName:@"Marker Felt" fontSize:64];
    
    // ask director for the window size
    CGSize size = [[CCDirector sharedDirector] winSize];
	
    // position the label on the center of the screen
    label.position =  ccp( size.width /2 , size.height/2 );
    
    // add the label as a child to this Layer
    [self addChild: label];
    }
    return self;
}
@end

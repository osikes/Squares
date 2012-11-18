//
//  Victory.m
//  Squares
//
//  Created by Owen Sikes on 11/16/12.
//
//

#import "Victory.h"
#import "Level1.h"
#import "MainLayerLvl1.h"
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
        CCMenuItem *restart = [CCMenuItemFont itemWithString:@"Play Again" block:^(id sender) {
			
          Level1 *scene = [[Level1 alloc]init];
            [[CCDirector sharedDirector] replaceScene:scene];
        }
                               ];
        
		CCMenu *menu = [CCMenu menuWithItems:restart, nil];
		
		[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( size.width/2, size.height/2 - 50)];
		
		// Add the menu to the layer
		[self addChild:menu];
        

    }
    return self;
}
@end

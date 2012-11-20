//
//  MainMenu.m
//  Squares
//
//  Created by Owen Sikes on 11/19/12.
//
//

#import "MainMenu.h"
#import "CCScene.h"
#import "Level1.h"
#import "Level2.h"
@implementation MainMenu



+(CCScene *) scene
{
		// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
		// 'layer' is an autorelease object.
	MainMenu *layer = [MainMenu node];
	
		// add layer as a child to scene
	[scene addChild: layer];
	
		// return the scene
	return scene;
}


-(id) init{
	
	if((self = [super init]))
    {
		CGSize size = [[CCDirector sharedDirector] winSize];

		CCMenuItem *level1 = [CCMenuItemFont itemWithString:@"Level One" block:^(id sender) {
			
			Level1 *scene = [[Level1 alloc]init];
            [[CCDirector sharedDirector] replaceScene:scene];
        }];
							  
		CCMenuItem *level2 = [CCMenuItemFont itemWithString:@"Level Two" block:^(id sender) {
			
			Level2 *scene = [[Level2 alloc]init];
            [[CCDirector sharedDirector] replaceScene:scene];
        }
						 ];
		
		CCMenu *menu = [CCMenu menuWithItems:level1,level2, nil];
		
		[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( size.width/2, size.height/2 - 50)];
		
		[self addChild:menu];
	}
	
	return self;
	
}

@end

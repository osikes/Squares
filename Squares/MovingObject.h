//
//  MovingObject.h
//  Squares
//
//  Created by Owen Sikes on 11/15/12.
//
//

#import "CCSprite.h"
#import "GameObject.h"
@interface MovingObject : GameObject
{
	BOOL down;
}
@property (nonatomic, assign) BOOL down;
-(id) init;
@end

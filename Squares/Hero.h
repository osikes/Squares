//
//  Hero.h
//  Squares
//
//  Created by Owen Sikes on 11/15/12.
//
//

#import "CCSprite.h"
#import "GameObject.h"
#import "MovingObject.h"
#import "CommonProtocol.h"
@interface Hero :GameObject
{
    int count;
    CharacterStates characterState;
}
-(id) initMy;
-(void)updateStateWithDeltaTime:(ccTime)deltaTime andListOfGameObjects:(NSMutableArray*)movers;
@property (readwrite) CharacterStates characterState;
-(void)changeState:(CharacterStates)newState;

@end

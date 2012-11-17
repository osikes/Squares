//
//  GameObject.h
//  Squares
//
//  Created by Owen Sikes on 11/16/12.
//
//

#import "CCSprite.h"
#import "CommonProtocol.h"
@interface GameObject : CCSprite
{
	CharacterTypes characterType;
}

@property (readwrite) CharacterTypes characterType;
-(CGRect)adjustedBoundingBox;
	
	@end

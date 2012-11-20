//
//  GameScore.h
//  Squares
//
//  Created by Owen Sikes on 11/19/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
@interface GameScore : NSObject
{
	int Score;
	CCLabelTTF *scorelbl;
}




- (int)Score;

- (void)setScore:(int)newValue;

- (CCLabelTTF *)scorelbl;

- (void)setScorelbl:(CCLabelTTF *)newValue;
-(void) updateValue:(int)value;

@end

//
//  GameScore.m
//  Squares
//
//  Created by Owen Sikes on 11/19/12.
//
//

#import "GameScore.h"

@implementation GameScore

-(id)init{
	
	
	self = [super init];
	Score = 0;
	scorelbl =  [CCLabelTTF labelWithString:@"0" fontName:@"Marker Felt" fontSize:32];

	return self;
}

- (int)Score {
    return Score;
}

- (void)setScore:(int)newValue {
    Score = newValue;
}

- (CCLabelTTF *)scorelbl {
    return scorelbl;
}

- (void)setScorelbl:(CCLabelTTF *)newValue {
    [scorelbl autorelease];
    scorelbl = [newValue retain];
}


-(void) updateValue:(int)value{
	Score = value;
	NSString *stringvalue = [NSString stringWithFormat:@"%d",value];
	[self updateText:stringvalue];
}

-(void) updateText:(NSString*)value{
	[scorelbl setString:value];
}

@end

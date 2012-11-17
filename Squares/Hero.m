//
//  Hero.m
//  Squares
//
//  Created by Owen Sikes on 11/15/12.
//
//

#import "Hero.h"
#import "cocos2d.h";
@implementation Hero

-(id) initMy{
    if( self = [super initWithFile:@"turtle.png"] ){
    }
    return self;
}

-(void) update
{
    if(count == 500)count=0;
    
    count++;
if(count ==499)
    [self runAction:[CCRepeatForever actionWithAction:[CCRotateTo actionWithDuration:1 angle:720]]];
    
    NSLog(@"%d",count);
    
}

@end

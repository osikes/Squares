//
//  CommonProtocol.h
//  Squares
//
//  Created by Owen Sikes on 11/16/12.
//
//


typedef enum
{
	kStateSpawning,
    kStateOnWater,
    kStateSlippingOff,
    kStateDead,
	kStateIdle,
	kStateMovingDown,
	kStateMovingUp,
	kStateVictory
} CharacterStates;

typedef  enum{
			
	herotype,
	endzone,
	smallimmoble,
	largeimmoble,
    starttzone,
	smallmoving,
	largemoving,
	smallmoving_horiztonal
	
}CharacterTypes;


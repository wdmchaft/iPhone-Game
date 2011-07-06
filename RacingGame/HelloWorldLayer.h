//
//  HelloWorldLayer.h
//  Traffic
//  Car Project
//
//  Created by iD Student Account on 7/5/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
	CCSprite *trafficCar;
	int trafficPositionX;
	int trafficPositionY;
	CGPoint pos;
	int carA;
	int carB;
	int carC;
	int carD;
	CCSprite *myCar;
<<<<<<< HEAD
	NSMutableArray *enemies;
=======
	CCSprite *roadWay;
>>>>>>> d8523b27bec3e85d76b0b45322c04b8d912e44e5
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end

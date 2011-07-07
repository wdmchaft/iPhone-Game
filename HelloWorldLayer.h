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
	int hardness;
	CCSprite *myCar;
	NSMutableArray *enemies;
	CCSprite *roadWay;
	float i;
	CCSprite *roadWay2;
	int life;
	CCSprite *Collision;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

-(int) randomlane;
-(int) randomlane2;
@end

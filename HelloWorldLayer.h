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
#import "ORLocalNetworkProtocol.h"
#import "GameKitConnector.h"
@class GameKitConnector;

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <ORLocalNetworkProtocol>
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
	CCSprite *Explosion;
	int roadspeed;
	int enemyspeed;
	int x;
	int px;
	int px2;
	int score;
	CCLabelTTF *scorecounter;
	CCLabelTTF *lifecounter;
	bool hit;
	int lifeafter;
    BOOL isHost;
    int randomNumber;
  
  bool multiplayer;
  CCSprite *player2Car;

  GameKitConnector *connection;
}

@property(retain, nonatomic) GameKitConnector *connection;
-(void)setGameKitConnection:(GameKitConnector*)gkConnection;
+(CCScene *) scene;

-(int) randomlane;
-(int) randomlane2;
-(void)checkWinner:(int)x;


@end

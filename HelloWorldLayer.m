//
//  HelloWorldLayer.m
//<<<<<<< HEAD
//  Traffic
//=======
//  Car Project
//>>>>>>> 8b70d25d2d82869278649254a393e360aeeb4f1e
//
//  Created by iD Student Account on 7/5/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "CCTouchDispatcher.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Traffic" fontName:@"Marker Felt" fontSize:64];
		
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
		
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
		enemies=[[NSMutableArray alloc] init];
		for (int i = 0; i <= 6; i++) {
			
			trafficCar= [CCSprite spriteWithFile:@"Enemy-Cars.png"];
			trafficPositionY=random()%465+5;
			int px = [self randomlane];
			int px2 = [self randomlane2];
			trafficCar.position=ccp( px,trafficPositionY);
			[enemies addObject:trafficCar];
			for(CCSprite *car in enemies){
			
				if(CGRectIntersectsRect([car boundingBox], [trafficCar boundingBox]))
				{
					//trafficCar.position.y=trafficPositionY+10;
				}
			}
			[self addChild: trafficCar z:10];
			
		}
		
		//creating myCar
		{
		myCar=[CCSprite spriteWithFile:@"myCar.png"];
		myCar.position = ccp(160,70);
			[self addChild:myCar z:10];
		self.isTouchEnabled=YES;
		}
<<<<<<< HEAD
		for (int i = 0; i<10; i++) {
		roadWay=[CCSprite spriteWithFile:@"Highway2.png"];
		//fix the center point as the picture is too large (320x5000)
=======
		
		{
		roadWay=[CCSprite spriteWithFile:@"Roadway.png"];
>>>>>>> 93423f81b1118e653132efcf92cf9cce5e6e7c35
		roadWay.position = ccp(160,480);
		[self addChild:roadWay z:0];
		[self schedule:@selector(nextFrame:)];
		}
<<<<<<< HEAD
		
=======
>>>>>>> 93423f81b1118e653132efcf92cf9cce5e6e7c35
	}
	
	return self;
}

-(void)nextFrame:(ccTime)dt{
	roadWay.position=ccp(roadWay.position.x,roadWay.position.y-5);
	if (roadWay.position.y < 0) {
		//roadWay.position=ccp(roadWay.position.x,roadWay.position.y+480);
	}
	
}

-(int) randomlane {
	
	int m=(random()%5+1);
	if (m==1)
	{
		trafficPositionX=32;
	}	
	else if (m==2)
	{
		trafficPositionX=96;
	}	
	else if (m==3)
	{
		trafficPositionX=160;
	}	
	else if (m==4)
	{
		trafficPositionX=224;
	}	
	else
	{
		trafficPositionX=288;
	}
	
	
	return trafficPositionX;
	
	
}	

-(int) randomlane2 {
	int c=(random()%480+1);
	if (c>240){
		trafficPositionY=c;
	}
	else if (c<=100){
		trafficPositionY=c+170;
	}
	else if (c<=220 && c>100){
		trafficPositionY=c+100;
	}
	return trafficPositionY;
}
	
- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	for (UITouch * touch in touches) {
		CGPoint location = [self convertTouchToNodeSpace:touch];
		if (location.x <= 159 && myCar.position.x>50) {
			
			myCar.position=ccp(myCar.position.x-64,myCar.position.y);
		}
 		if (location.x >= 160 && myCar.position.x<270) {
			myCar.position=ccp(myCar.position.x+64,	myCar.position.y);		
		}
		//[myCar stopAllActions];
	}
}

// on "dealloc" you need to release all your retained objects

- (void) dealloc{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end

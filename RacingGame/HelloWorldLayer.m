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

+(CCScene *) scene
{
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
-(id) init
{
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
		
		for (int i = 0; i < 50; i++) {
			
			trafficCar= [CCSprite spriteWithFile:@"Icon.png"];
			trafficPositionY=random()%465+5;
			int px = [self randomlane];
			trafficCar.position=ccp( px,trafficPositionY);
			[self addChild: trafficCar];
			
		}
		
		myCar=[CCSprite spriteWithFile:@"myCar.png"];
		myCar.position = ccp(160,70);
		[self addChild:myCar];
		self.isTouchEnabled=YES;
	}
	
	return self;
}
-(int) randomlane {
	
	int m=(random()%5+1);
	if (m==1)
	{
		trafficPositionX=(random()%58+1);
	}	
	else if (m==2)
	{
		trafficPositionX=(random()%58+65);
	}	
	else if (m==3)
	{
		trafficPositionX=(random()%58+130);
	}	
	else if (m==4)
	{
		trafficPositionX=(random()%58+195);
	}	
	else
	{
		trafficPositionX=(random()%58+260);
	}
	
	
	return trafficPositionX;
	
	
}	

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	for (UITouch * touch in touches) {
		CGPoint location = [self convertTouchToNodeSpace:touch];
		if (location.x <= 159 && myCar.position.x>100) {
			
			myCar.position=ccp(myCar.position.x-58,myCar.position.y);
		}
		if (location.x >= 160 && myCar.position.x<220) {
			myCar.position=ccp(myCar.position.x+58,	
							   myCar.position.y);		
		}
		//[myCar stopAllActions];
	}
}

// on "dealloc" you need to release all your retained objects


- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end

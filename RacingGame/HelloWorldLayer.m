//
//  HelloWorldLayer.m
//  Car Project
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
		myCar=[CCSprite spriteWithFile:@"myCar.png"];
		myCar.position = ccp(160,70);
		[self addChild:myCar];
		self.isTouchEnabled=YES;
	}
	return self;
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

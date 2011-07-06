//
//  Traffic
//  Car Project
//
//  Created by iD Student Account on 7/5/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//
//MAKE SURE TO INCLUDE THE BOOLEANS FOR THE CHEATS! I have them as comments so that the program will run smoothly

// Import the interfaces
#import "mainMenuLayer.h"
#import "CCTouchDispatcher.h"
#import "HelloWorldLayer.h"


// HelloWorldLayer implementation
@implementation MainMenuLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainMenuLayer *layer = [MainMenuLayer node];
	
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
		
		
		
		// ask director the the window size
		//CGSize size = [[CCDirector sharedDirector] winSize];
		
		// position the label on the center of the screen
		//label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		//[self addChild: label];
		CCMenuItem *item = [CCMenuItemImage itemFromNormalImage:@"Button.png" selectedImage:@"Button.png" target: self selector:@selector(startGame:)];
		item.position = ccp(200, 150);
		
		CCMenu *menu = [CCMenu menuWithItems:item, nil];
		menu.position = CGPointZero;
		[self addChild:menu];
		CCLabelTTF *welcome = [CCLabelTTF labelWithString:@"Welcome to Traffic" fontName:@"Marker Felt" fontSize:40];
		// position the label on the center of the screen
		welcome.position =  ccp(160, 240);
		
		// add the label as a child to this Layer
		[self addChild: welcome];
		
		self.isTouchEnabled=YES;
		/*CCMenuItem *item = [CCMenuItemImage itemFromNormalImage:@"Cheats.png" selectedImage:@"Cheats.png" target: self selector:@selector(startGame:)];
		item.position = ccp(250, 100);
		
		CCMenu *menu = [CCMenu menuWithItems:item, nil];
		menu.position = CGPointZero;
		[self addChild:menu];*/
		
		
		self.isTouchEnabled=YES;
		
	}
	
	return self;
}

-(void)startGame: (id)sender{
	CCScene * newScene = [HelloWorldLayer scene];
	[[CCDirector sharedDirector] replaceScene:newScene];
	NSLog(@"SHIZNIT BIZZATCHES");
}
/*-(void)startGame: (id) sender {
	CCScene * newScene = [CheatsLayer scene];
	[[CCDirector sharedDirector] replaceScene:newScene];
} */

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

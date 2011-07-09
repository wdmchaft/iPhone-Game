#import "YOULOSE.h"
#import "mainMenuLayer.h"
#import "CCTouchDispatcher.h"
#import "HelloWorldLayer.h"

@implementation YOULOSE
+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	
		YOULOSE *layer = [YOULOSE node];
	layer.tag=2;
	
		[scene addChild: layer];
	
		return scene;
}
-(id) init {
	if( (self=[super init])) {
  CCLabelTTF *byebye = [CCLabelTTF labelWithString:@"GAME" fontName:@"Marker Felt" fontSize:72];
  byebye.position =  ccp(160, 240);
    
	CCLabelTTF *byebye2 = [CCLabelTTF labelWithString:@"OVER" fontName:@"Marker Felt" fontSize:72];
	byebye2.position = ccp(160, 150);
    
  [self addChild: byebye];
	[self addChild:byebye2];
	CCMenuItem *playagain = [CCMenuItemImage itemFromNormalImage:@"PlayAgain.png" selectedImage:@"PlayAgain.png" target: self selector:@selector(restartGame:)];
	playagain.position = ccp(160, 30);
	
	CCMenu *menu2 = [CCMenu menuWithItems:playagain, nil];
	menu2.position = CGPointZero;
	[self addChild:menu2];
  }
	
	return self;
}

-(void)loser:(int)score{
	finalscore = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Your final score was: %i", score] fontName:@"Marker Felt" fontSize:20];
	finalscore.position =  ccp(160, 300);
		[self addChild: finalscore];
}
-(void)restartGame: (id)sender{
	CCScene * newScene = [HelloWorldLayer scene];
	[[CCDirector sharedDirector] replaceScene:newScene];
}
	

@end

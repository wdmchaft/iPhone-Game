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
#import <AudioToolbox/AudioToolbox.h>

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
		
		life = 3;
		//creating myCar
		
        myCar=[CCSprite spriteWithFile:@"car_sprite 2.png"];
        myCar.position = ccp(160,70);
        [self addChild:myCar z:10];
        self.isTouchEnabled=YES;
        
        
        roadWay=[CCSprite spriteWithFile:@"Highway3.png"];
        roadWay2=[CCSprite spriteWithFile:@"Highway3 copy.png"];
        roadWay.position = ccp(160,0);
        [self addChild:roadWay z:0];
        roadWay2.position = ccp(160,1058);
        [self addChild:roadWay2 z:0];		
        [self schedule:@selector(nextFrame:)];
		enemyspeed=-3;
		roadspeed=-5;
    }
    
    return self;
}

-(void)nextFrame:(ccTime)dt{
    roadWay.position = ccp(roadWay.position.x, roadWay.position.y +(-0.0019*x)+roadspeed);
    if (roadWay.position.y < -50) {
        roadWay.position = ccp(roadWay.position.x ,520);
    }
    
    for(CCSprite *car in enemies){
        car.position = ccp(car.position.x,car.position.y+(-0.0019*x)+enemyspeed);
		if(car.position.y<=-120)
		{
			[enemies removeObject:car];
		}
    }
	if(x>120){
		i = i++;
	}
		while ( i >= 30) {
			for (int j = 1; j<=(3+(0.0013*x)); j++) {
				trafficCar = [CCSprite spriteWithFile:@"Enemy-Cars.png"];
				trafficPositionY = random() % 465+5;
				int px = [self randomlane];
				int px2 = [self randomlane2];
				trafficCar.position = ccp(px, px2);
				
				for(CCSprite *car in enemies){
					
					while( CGRectIntersectsRect([car boundingBox], [trafficCar boundingBox]) ) {
						px = [self randomlane];
						px2 = [self randomlane2];
						NSLog(@"x:%i y:%i",px,px2);
						trafficCar.position = ccp(px, px2);
					}
					
				}
				[enemies addObject:trafficCar];
				
				[self addChild: trafficCar z:10];
			}
			i = i - 70;
    }
    
    for(CCSprite *car in enemies){
        
        if(CGRectIntersectsRect([car boundingBox], [myCar boundingBox]) ) {
            NSLog(@"collision  ");
            CCTexture2D *texture = [[CCTexture2D alloc] initWithImage:[UIImage imageNamed:@"Explosion.png"]];
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
			roadspeed=0;
			enemyspeed=3;
			x=0;
			i=-180; //time before cars spawn again
            [myCar setTexture:texture];
			life--;
        }
		
    }
	x++;
	//time we get befoew our cars spawns
	if(x>120){
		roadspeed=-5;
		enemyspeed=-3;
		CCTexture2D *texture = [[CCTexture2D alloc] initWithImage:[UIImage imageNamed:@"car_sprite 2.png"]];
		[myCar setTexture:texture];		
	}
    
}

-(int) randomlane {
    
    int m=(random()%5+1);
    if (m==1){
        trafficPositionX=32;
    }	
    else if (m==2){
        trafficPositionX=96;
    }	
    else if (m==3){
        trafficPositionX=160;
    }	
    else if (m==4){
        trafficPositionX=224;
    }else{
        trafficPositionX=288;
    }
    return trafficPositionX;
}	

-(int) randomlane2 {
    int c = (random()%480+1);
    
    trafficPositionY = c + 480;
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

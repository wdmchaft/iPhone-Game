//
//  HelloWorldLayer.m
//
//  Created by iD Student Account on 7/5/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "CCTouchDispatcher.h"
#import <AudioToolbox/AudioToolbox.h>
#import "YOULOSE.h"
#import "GameKitConnector.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer
@synthesize connection;

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
		lifeafter = 3;
		life = 3;
    multiplayer = true;
    
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

		enemyspeed =- 3;
		roadspeed =- 5;
	}
	scorecounter = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Score: %i", score] fontName:@"Marker Felt" fontSize:20];
	scorecounter.position =  ccp(50, 50);

	[self addChild:scorecounter z:0];
	lifecounter = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Life: %i", life] fontName:@"Marker Felt" fontSize:20];
	
	lifecounter.position =  ccp(270, 50);

	[self addChild:lifecounter z:0];
  
  return self;
}

-(void)nextFrame:(ccTime)dt{
	lifecounter.string = [NSString stringWithFormat:@"Life: %i", lifeafter];
	scorecounter.string = [NSString stringWithFormat:@"Score: %i", score];
    roadWay.position = ccp(roadWay.position.x, roadWay.position.y +(-0.0019*x)+roadspeed);
    if (roadWay.position.y < -50) {
        roadWay.position = ccp(roadWay.position.x ,520);
        score++;
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
			px = [self randomlane];
			px2 = [self randomlane2];
			trafficCar.position = ccp(px, px2);
			
			for(CCSprite *car in enemies){
				
				while( CGRectIntersectsRect([car boundingBox], [trafficCar boundingBox]) ) {
					px = [self randomlane];
					px2 = [self randomlane2];
					trafficCar.position = ccp(px, px2);
				}
				
			}
			[enemies addObject:trafficCar];
			[self addChild: trafficCar z:10];
		}
		//hopefully our five car not spawning together code
		for(CCSprite *car in enemies){
			
			if((trafficCar.position.x==32)&&(car.position.x==96)){
				if(abs(trafficCar.position.y-car.position.y)<=80){
					px2+=80;
					trafficCar.position=ccp(px,px2);
				}
			}
			
			if((trafficCar.position.x==96)&&(car.position.x==32)){
				if(abs(trafficCar.position.y-car.position.y)<=80){
					px2+=80;
					trafficCar.position=ccp(px,px2);
				}
			}
			
			if((trafficCar.position.x==96)&&(car.position.x==160)){
				if(abs(trafficCar.position.y-car.position.y)<=80){
					px2+=80;
					trafficCar.position=ccp(px,px2);
				}
			}
			
			if((trafficCar.position.x==160)&&(car.position.x==96)){
				if(abs(trafficCar.position.y-car.position.y)<=80){
					px2+=80;
					trafficCar.position=ccp(px,px2);
				}
			}
			
			if((trafficCar.position.x==160)&&(car.position.x==224)){
				if(abs(trafficCar.position.y-car.position.y)<=80){
					px2+=80;
					trafficCar.position=ccp(px,px2);
				}
			}
			
			if((trafficCar.position.x==224)&&(car.position.x==160)){
				if(abs(trafficCar.position.y-car.position.y)<=80){
					px2+=80;
					trafficCar.position=ccp(px,px2);
				}
			}
			
			if((trafficCar.position.x==224)&&(car.position.x==228)){
				if(abs(trafficCar.position.y-car.position.y)<=80){
					px2+=80;
					trafficCar.position=ccp(px,px2);
				}
			}
			
			if((trafficCar.position.x==288)&&(car.position.x==224)){
				if(abs(trafficCar.position.y-car.position.y)<=80){
					px2+=80;
					trafficCar.position=ccp(px,px2);
				}
			}
		
			i = i - 70;
		}
		
  }
  
    x++;
    for(CCSprite *car in enemies){
          if(CGRectIntersectsRect([car boundingBox], [myCar boundingBox]) ) {
            if(multiplayer){
              [self.connection sendArray:[NSArray arrayWithObject:@"car_crash"]];
            }
            
            NSLog(@"collision  ");
            CCTexture2D *texture = [[CCTexture2D alloc] initWithImage:[UIImage imageNamed:@"Explosion.png"]];
            [myCar setTexture:texture];
            [self crash];
            
        if(lifeafter < 0){
          if (multiplayer) {
            [self.connection sendArray:[NSArray arrayWithObject:@"game_over"]];
          }
          CCScene * newScene = [YOULOSE scene];
          [[CCDirector sharedDirector] replaceScene:newScene];
          NSLog(@"Lost");
          CCLayer *layer=[newScene getChildByTag:2];
          [layer loser:score];
          lifeafter--;
          if(hit == true){
            life -= 1;
          }
        }
      }
    }
		
		//time we get before our car spawns
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
          [self.connection sendArray:[NSArray arrayWithsObject:@"car_pos", NSStringFromCGPoint(myCar.position), nil] ];
			}
      
			if (location.x >= 160 && myCar.position.x<270) {
				myCar.position=ccp(myCar.position.x+64,	myCar.position.y);		
        if (multiplayer) {
          [self.connection sendArray:[NSArray arrayWithObjects:@"car_pos", NSStringFromCGPoint(myCar.position), nil] ];
        }
			}
			//[myCar stopAllActions];
		}
	}
-(void)youWon{
  //do something here
}

-(void) crash{  
  AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
  roadspeed=0;
  enemyspeed=3;
  x=0;
  i=-180; //time before cars spawn again
}
	// on "dealloc" you need to release all your retained objects
	
	- (void) dealloc{
		// in case you have something to dealloc, do it in this method
		// in this particular example nothing needs to be released.
		// cocos2d will automatically release all the children (Label)
		
		// don't forget to call "super dealloc"
		[super dealloc];
	}

-(void)setGameKitConnection:(GameKitConnector*)gkConnection{
  self.connection = gkConnection;
  self.connection.delegate = self;
  multiplayer = true;
  
  player2Car=[CCSprite spriteWithFile:@"car_player_2.png"];
  player2Car.position = ccp(100,70);
  [self addChild:player2Car z:10];
}

-(void) connectionCancelled {
  // two player disconnect
  CCScene * newScene = [MainMenuLayer scene];
	[[CCDirector sharedDirector] replaceScene:newScene];
  
}

-(void) connected { NSLog(@"doing nothing.."); }

-(void) recievedArray:(NSArray*)response {
  //first object is always command
  NSString * command =  [response objectAtIndex:0];
  if ( [command isEqualToString:@"car_pos"] ) {
    player2Car.position = CGPointFromString([response objectAtIndex:1]);
  }
  
  if( [command isEqualToString:@"car_crash"] ){
    [self crash];
  }
  if( [command isEqualToString:@"you_won"] ){
    [self youWon];
  }
}


	@end

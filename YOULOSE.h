//
//  YOULOSE.h
//  RacingGame
//
//  Created by iD Student Account on 7/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HelloWorldLayer.h"
#import "mainMenuLayer.h"


@interface YOULOSE : CCLayer {
	CCLabelTTF *finalscore;
}

-(void)loser:(int)score;

@end

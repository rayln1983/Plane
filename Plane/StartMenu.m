//
//  StartMenu.m
//  Plane
//
//  Created by Rayln Guan on 9/29/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "StartMenu.h"
#import "CCBReader.h"


@implementation StartMenu

- (void)startGame:(id)sender{
    CCScene *scene = [CCBReader sceneWithNodeGraphFromFile:@"Main.ccbi"];
    	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:scene withColor:ccc3(195, 199, 202)]];
};

@end

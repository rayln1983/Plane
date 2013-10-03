//
//  Player.h
//  Plane
//
//  Created by Rayln Guan on 9/29/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameObject.h"
#import "Bullet.h"

@interface Player : GameObject <CCTargetedTouchDelegate, CCTouchDelegate> {
    //int life;
    //CGPoint position;
}
@property (nonatomic, strong) CCSprite *player;
@property (nonatomic, strong) Bullet *bullet;

- (CCSprite *) fire;

@end

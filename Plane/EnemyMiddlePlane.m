//
//  EnemyMiddlePlane.m
//  Plane
//
//  Created by Rayln Guan on 9/30/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "EnemyMiddlePlane.h"


@implementation EnemyMiddlePlane
// x 128   y  0  w 69    h 89
// break x 200  y 42  w 40 h 42

- (id)init{
    self = [super init];
    if(self){
        life = 3;
        int orginX = [Util random:35 :290];
        position = CGPointMake(orginX, 600);
        //self.bomb = [CCSpriteFrame frameWithTexture:[[self.batchNode textureAtlas] texture] rect:CGRectMake(143, 91, 36, 39)];
        self.bomb = [BombEffect bombEffect:self.batchNode];
        self.sprite = [self createSprite:CGRectMake(131, 0, 67, 90)];
                //[self.sprite setColor:ccBLACK];
        self.sprite.position = position;
        [self addChild:self.sprite];
        [self.sprite runAction:[CCMoveTo actionWithDuration:10 position:CGPointMake(orginX, -100)]];
    }
    return self;
}

- (int)handleCollision{
    life--;
    if(life <= 0){
        [self.sprite stopAllActions];
        //[self.sprite setDisplayFrame:self.bomb];
        [self.bomb runMiddleEffect:self.sprite];
        //[NSThread sleepForTimeInterval:.5];
        return YES;
    }
    return NO;
}

@end

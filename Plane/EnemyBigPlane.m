//
//  EnemyBigPlane.m
//  Plane
//
//  Created by Rayln Guan on 9/29/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "EnemyBigPlane.h"
#import "Util.h"


@implementation EnemyBigPlane

//break x 143 y 91 w 36 h 39

- (id)init{
    self = [super init];
    if(self){
        life = 10;
        int orginX = [Util random:35 :290];
        position = CGPointMake(orginX, 600);
        
        self.sprite = [self createSprite:CGRectMake(0, 0, 113, 164)];
        self.bomb = [BombEffect bombEffect:self.batchNode];
        [self.sprite setPosition:position];
        [self addChild:self.sprite];
        [self.sprite runAction:[CCMoveTo actionWithDuration:20 position:CGPointMake(orginX, -100)]];
    }
    return self;
}

- (int)handleCollision{
    life--;
    if(life <= 0){
        [self.sprite stopAllActions];
        //[self.sprite setDisplayFrame:self.bomb];
        [self.bomb runMiddleEffect:self.sprite];
        //[self.sprite ]
        //[NSThread sleepForTimeInterval:.5];
        return YES;
    }
    return NO;
}

@end

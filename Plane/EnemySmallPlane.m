//
//  EnemySmallPlane.m
//  Plane
//
//  Created by Rayln Guan on 9/30/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "EnemySmallPlane.h"
#import "Util.h"


@implementation EnemySmallPlane

//x 199  y 86  w 39  h 28
// break x 214 y 115 w 26 h 27
- (id)init{
    self = [super init];
    if(self){
        life = 1;
        int orginX = [Util random:35 :290];
        position = CGPointMake(orginX, 600);
        //self.bomb = [CCSpriteFrame frameWithTexture:[[self.batchNode textureAtlas] texture] rect:CGRectMake(214, 115, 26, 27)];
        self.bomb = [BombEffect bombEffect:self.batchNode];
        self.sprite = [self createSprite:CGRectMake(199, 86, 39, 28)];
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

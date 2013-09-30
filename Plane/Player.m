//
//  Player.m
//  Plane
//
//  Created by Rayln Guan on 9/29/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Player.h"
#import "Bullet.h"

@implementation Player

//bomb buff x 181 y 114 w 34  h  31

- (id)init{
    self = [super init];
    if(self){
        life = 1;
        position =CGPointMake(150, 150);
        
        self.player = [self createSprite:CGRectMake(64, 168, 64, 68)];
        [self.player setPosition:position];
        [self addChild:self.player];
        
    }
    return self;
}

- (Bullet *)fire{
    return [self createBulletType1];
}

- (Bullet *)createBulletType1{
    Bullet *bullet = [[Bullet alloc] init];
    [bullet createRedBullte];
    
    [bullet.sprite setPosition:CGPointMake(position.x, position.y+43)];
    [self addChild:bullet.sprite];
    [bullet.sprite runAction:[CCMoveBy actionWithDuration:.4 position:CGPointMake(0, 500)]];
    return bullet;
}

@end

//
//  EnemyBigPlane.m
//  Plane
//
//  Created by Rayln Guan on 9/29/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "EnemyBigPlane.h"


@implementation EnemyBigPlane

//break x 143 y 91 w 36 h 39

- (id)init{
    self = [super init];
    if(self){
        life = 10;
        position = CGPointMake(150, 300);
        
        self.sprite = [self createSprite:CGRectMake(0, 0, 113, 164)];
        [self.sprite setPosition:position];
        [self addChild:self.sprite];
        [self.sprite runAction:[CCMoveTo actionWithDuration:20 position:CGPointMake(150, 0)]];
    }
    return self;
}

- (int)handleCollision{
    life--;
    if(life <= 0){
        [self.sprite stopAllActions];
        return YES;
    }
    return NO;
}

@end

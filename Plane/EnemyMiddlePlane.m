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
        position = CGPointMake([Util random:35 :290], 600);

        self.sprite = [self createSprite:CGRectMake(128, 0, 69, 89)];
        self.position = position;
        [self addChild:self.sprite];
        
        [self.sprite runAction:[CCMoveBy actionWithDuration:10 position:CGPointMake(0, -700)]];
    }
    return self;
}

- (int)handleCollision{
    return 0;
}

@end

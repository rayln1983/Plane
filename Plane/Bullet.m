//
//  Bullet.m
//  Plane
//
//  Created by rayln on 13-9-30.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Bullet.h"


@implementation Bullet

- (id)init{
    self = [super self];
    if(self){
        
        self.bullet = [self createSprite:CGRectMake(64, 235, 8, 16)];
        [self.bullet setPosition:CGPointMake(100, 100)];
        [self addChild:self.bullet];
    }
    return self;
}

@end

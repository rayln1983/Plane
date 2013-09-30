//
//  EnemyBigPlane.m
//  Plane
//
//  Created by Rayln Guan on 9/29/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "EnemyBigPlane.h"


@implementation EnemyBigPlane

- (id)init{
    self = [super init];
    if(self){
        life = 10;
        position = CGPointMake(150, 300);
        
        CCSpriteBatchNode* path = [CCSpriteBatchNode batchNodeWithFile:@"plane.png"];
        //[self addChild:path z:0 tag:0];
        self.enemy = [CCSprite spriteWithTexture:[[path textureAtlas] texture] rect:CGRectMake(0, 0, 113, 164)];
        [self.enemy setPosition:position];
        [self addChild:self.enemy];

    }
    return self;
}

@end

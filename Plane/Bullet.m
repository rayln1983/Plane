//
//  Bullet.m
//  Plane
//
//  Created by rayln on 13-9-30.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Bullet.h"


@implementation Bullet

-(id)init{
    self = [super init];
    if(self){
        self.batchNode = [CCSpriteBatchNode batchNodeWithFile:@"plane.png"];
    }
    return self;
}
- (int)handleCollision{
    [self.sprite stopAllActions];
    return 2;
}
- (void)createBlueBullte{
    self.sprite = [CCSprite spriteWithTexture:[[self.batchNode textureAtlas] texture] rect:CGRectMake(64, 235, 12, 20)];
}

- (void)createRedBullte{
    self.sprite = [CCSprite spriteWithTexture:[[self.batchNode textureAtlas] texture] rect:CGRectMake(109, 0, 12, 20)];
}
@end

//
//  GameObject.m
//  Plane
//
//  Created by rayln on 13-9-29.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "GameObject.h"


@implementation GameObject

- (id)init{
    self = [super init];
    if(self){
        self.batchNode = [CCSpriteBatchNode batchNodeWithFile:@"plane.png"];
    }
    return self;
}

- (CCSprite *)createSprite:(CGRect) rect{
    return [CCSprite spriteWithTexture:[[self.batchNode textureAtlas] texture] rect:rect];
}

@end

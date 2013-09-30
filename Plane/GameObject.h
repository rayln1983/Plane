//
//  GameObject.h
//  Plane
//
//  Created by rayln on 13-9-29.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameObject : CCNode {
    int life;
    CGPoint position;
}
@property (nonatomic, strong) CCSprite *sprite;
@property (nonatomic, strong) CCSpriteBatchNode* batchNode;
- (BOOL)handleCollision;
- (CCSprite *)createSprite:(CGRect) rect;
@end

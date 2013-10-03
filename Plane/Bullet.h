//
//  Bullet.h
//  Plane
//
//  Created by rayln on 13-9-30.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Bullet : CCSprite {
    
}
@property (nonatomic, strong) CCSprite *sprite;

+ (void) bullet;
- (int)handleCollision;
- (void)createBlueBullte;
- (void)createRedBullte;
@end

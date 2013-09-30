//
//  MainGame.h
//  Plane
//
//  Created by Rayln Guan on 9/29/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"

@interface MainGame : CCLayer {
    
}

@property (atomic, strong) NSMutableArray *enemyList;
@property (atomic, strong) NSMutableArray *bulletList;
@property (atomic, strong) NSMutableArray *removeEnemyList;
@property (atomic, strong) NSMutableArray *removeBulletList;
@property (nonatomic, strong) Player *player;

@end

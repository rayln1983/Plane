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

@property (nonatomic, strong) NSMutableArray *enemyList;
@property (nonatomic, strong) NSMutableArray *bulletList;
@property (nonatomic, strong) NSMutableArray *removeList;
@property (nonatomic, strong) Player *player;

@end

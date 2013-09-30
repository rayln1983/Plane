//
//  MainGame.m
//  Plane
//
//  Created by Rayln Guan on 9/29/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "MainGame.h"
#import "CCBReader.h"
#import "Background.h"
#import "Player.h"
#import "EnemyBigPlane.h"
#import "GameObject.h"

@implementation MainGame
 
- (id)init{
    self = [super init];
    if(self){
        [self setEnemyList:[NSMutableArray array]];
        [self createSprite];
        [self createEnemy];
        [self schedule:@selector(update) interval:0.05];
    }
    return self;
};

- (void)createSprite{
    Background *bg = [[Background alloc] init];
    [self addChild:bg];
    
    self.player = [[Player alloc] init];
    [self addChild:self.player];
    
    [self schedule:@selector(fire) interval:.3];
}

- (void)fire{
    [self.player fire];
}

- (void)createEnemy{
    EnemyBigPlane *big = [[EnemyBigPlane alloc] init];
    [self addChild:big];
    [self.enemyList addObject:big];
}

- (void)update{
    
    for (GameObject *enemy in self.enemyList) {
        CGRect playerRect = CGRectMake(self.player.player.position.x, self.player.player.position.y, [self.player.player textureRect].size.width, [self.player.player textureRect].size.height);
        CGRect enemyRect = CGRectMake(enemy.sprite.position.x, enemy.sprite.position.y, enemy.sprite.textureRect.size.width, enemy.sprite.textureRect.size.height);
        if([self isCollision:playerRect :enemyRect]){
            if([enemy handleCollision]){
                
                [self.enemyList removeObject:enemy];
            }
        
        }
    }
    
    for (GameObject *enemy in self.enemyList) {
        CGRect enemyRect = CGRectMake(enemy.sprite.position.x, enemy.sprite.position.y, enemy.sprite.textureRect.size.width, enemy.sprite.textureRect.size.height);
        for (GameObject *bullet in self.bulletList) {
            CGRect bulletRect = CGRectMake(bullet.sprite.position.x, bullet.sprite.position.y, [bullet.sprite textureRect].size.width, [bullet.sprite textureRect].size.height);
            if([self isCollision:bulletRect :enemyRect]){
                BOOL destory = [enemy handleCollision];
                [bullet handleCollision];
            }
        }
    }
}

- (BOOL)isCollision: (CGRect)rect1 :(CGRect)rect2{
    CGPoint point1 = rect1.origin;
    CGPoint point2 = rect2.origin;
    CGSize size1 = rect1.size;
    CGSize size2 = rect2.size;
    CGPoint actPoint = CGPointMake(fabs(point1.x-point2.x), fabs(point1.y-point2.y));
    CGPoint minPoint = CGPointMake(fabs(size1.width/2+size2.width/2), fabs(size1.height/2+size2.height/2));
<<<<<<< HEAD
=======
    //NSLog(@"%f,%f  %f,%f",minPoint.x,actPoint.x,minPoint.y,minPoint.y);
>>>>>>> e3fb961e84af40c0302f274096ab3d7473e93404
    if (minPoint.x > actPoint.x && minPoint.y > actPoint.y) {
        return YES;
    }
    return NO;
}

@end

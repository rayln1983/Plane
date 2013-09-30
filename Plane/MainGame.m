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
#import "EnemyMiddlePlane.h"
#import "GameObject.h"

@implementation MainGame
 
- (id)init{
    self = [super init];
    if(self){
        self.removeEnemyList = [NSMutableArray array];
        self.removeBulletList = [NSMutableArray array];
        self.enemyList = [NSMutableArray array];
        self.bulletList = [NSMutableArray array];
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
    [self.bulletList addObject:[self.player fire]];
    NSLog(@"===%zi", [self.bulletList count]);
}

- (void)createEnemy{
    EnemyBigPlane *big = [[EnemyBigPlane alloc] init];
    [self addChild:big];
    [self.enemyList addObject:big];
    
    EnemyMiddlePlane *mid = [[EnemyMiddlePlane alloc] init];
    [self addChild:mid];
    [self.enemyList addObject:mid];
}

- (void)update{
    for (GameObject *enemy in self.enemyList) {
        CGRect playerRect = CGRectMake(self.player.player.position.x, self.player.player.position.y, [self.player.player textureRect].size.width, [self.player.player textureRect].size.height);
        CGRect enemyRect = CGRectMake(enemy.sprite.position.x, enemy.sprite.position.y, enemy.sprite.textureRect.size.width, enemy.sprite.textureRect.size.height);
        if([self isCollision:playerRect :enemyRect]){
            if([enemy handleCollision]){
                [self.removeEnemyList addObject:enemy];
                //[self removeChild:enemy cleanup:NO];
                //[self removeChild:self.player cleanup:YES];
            }
        }
    }
    [self.enemyList removeObjectsInArray:self.removeEnemyList];
    [self.removeEnemyList removeAllObjects];
    
    for (Bullet *bullet in self.bulletList) {
        for (GameObject *enemy in self.enemyList) {
            CGRect enemyRect = CGRectMake(enemy.sprite.position.x, enemy.sprite.position.y, enemy.sprite.textureRect.size.width, enemy.sprite.textureRect.size.height);
            CGRect bulletRect = CGRectMake(bullet.sprite.position.x, bullet.sprite.position.y, [bullet.sprite textureRect].size.width, [bullet.sprite textureRect].size.height);
            if([self isCollision:bulletRect :enemyRect]){
                BOOL destory = [enemy handleCollision];
                if([bullet handleCollision]){
                    [self.player removeChild:bullet.sprite cleanup:YES];
                    [self.bulletList removeObject:bullet];
                }
            }
        }
    }
}
//
- (BOOL)isCollision: (CGRect)rect1 :(CGRect)rect2{
    CGPoint point1 = rect1.origin;
    CGPoint point2 = rect2.origin;
    CGSize size1 = rect1.size;
    CGSize size2 = rect2.size;
    CGPoint actPoint = CGPointMake(fabs(point1.x-point2.x), fabs(point1.y-point2.y));
    CGPoint minPoint = CGPointMake(fabs(size1.width/2+size2.width/2), fabs(size1.height/2+size2.height/2));
    if (minPoint.x > actPoint.x && minPoint.y > actPoint.y) {
        return YES;
    }
    return NO;
}

@end

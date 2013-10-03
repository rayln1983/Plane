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
#import "EnemySmallPlane.h"
#import "GameObject.h"

@implementation MainGame

+ (CCScene *)scene{
    return [CCBReader sceneWithNodeGraphFromFile:@"Main.ccbi"];
}

- (id)init{
    self = [super init];
    if(self){
        self.isTouchEnabled = YES;
        self.removeEnemyList = [NSMutableArray array];
        self.removeBulletList = [NSMutableArray array];
        self.enemyList = [NSMutableArray array];
        self.bulletList = [NSMutableArray array];
        [self createBackground];
        [self createSprite];
        //[self createEnemy];
        [self schedule:@selector(createEnemy) interval:1];
        [self schedule:@selector(update) interval:.02];
    }
    return self;
};
- (void)createBackground{
    Background *bg = [[[Background alloc] init] autorelease];
    [self addChild:bg];

}
- (void)createSprite{
    
    self.player = [[[Player alloc] init] autorelease];
    [self addChild:self.player];
    
    [self schedule:@selector(fire) interval:.3];
}

- (void)fire{
    [self.bulletList addObject:[self.player fire]];
}

- (void)createEnemy{
    int number = [Util random:0 :9];
    if(number <= 1){ 
        EnemyBigPlane *big = [[[EnemyBigPlane alloc] init] autorelease];
        [self addChild:big];
        [self.enemyList addObject:big];

    }else if(number >1 && number <=4){
        
        EnemyMiddlePlane *mid = [[[EnemyMiddlePlane alloc] init] autorelease];
        [self addChild:mid];
        [self.enemyList addObject:mid];

    }else{
        EnemySmallPlane *small = [[[EnemySmallPlane alloc] init] autorelease];
        [self addChild:small];
        [self.enemyList addObject:small];

    }
    
}

- (void)gameover{
    //[self removeChild:self.player cleanup:YES];

    [self unscheduleAllSelectors];
    //[self unschedule:@selector(fire)];
    //[self unschedule:@selector(createEnemy)];
    [self scheduleOnce:@selector(clearup) delay:.1];
    
}

- (void)clearup{
    [self removeAllChildrenWithCleanup:YES];
    [self createBackground];
    [self.removeBulletList removeAllObjects];
    [self.removeEnemyList removeAllObjects];
    [self.bulletList removeAllObjects];
    [self.enemyList removeAllObjects];
}

- (void)update{
    for (GameObject *enemy in self.enemyList) {
        CGRect playerRect = CGRectMake(self.player.player.position.x, self.player.player.position.y, [self.player.player textureRect].size.width, [self.player.player textureRect].size.height);
        CGRect enemyRect = CGRectMake(enemy.sprite.position.x, enemy.sprite.position.y, enemy.sprite.textureRect.size.width, enemy.sprite.textureRect.size.height);

        if([self isCollision:playerRect :enemyRect]){
            //[[CCDirector sharedDirector] pause];
            [self gameover];
        }
    }

    
    for (Bullet *bullet in self.bulletList) {
        for (GameObject *enemy in self.enemyList) {
            CGRect enemyRect = CGRectMake(enemy.sprite.position.x, enemy.sprite.position.y, enemy.sprite.textureRect.size.width, enemy.sprite.textureRect.size.height);
            CGRect bulletRect = CGRectMake(bullet.sprite.position.x, bullet.sprite.position.y, [bullet.sprite textureRect].size.width, [bullet.sprite textureRect].size.height);
            if([self isCollision:bulletRect :enemyRect]){
                if([enemy handleCollision]){
                    [self.removeEnemyList addObject:enemy];
                    [NSThread detachNewThreadSelector:@selector(removeEnemy:) toTarget:self withObject:enemy];
                    //[self removeEnemy:enemy];
                    //[self scheduleOnce:@selector(removeEnemy:) delay:.5];
                }
                if([bullet handleCollision]){
                    [self.player removeChild:bullet.sprite cleanup:YES];
                    [self.removeBulletList addObject:bullet];
                }
            }
            if(enemy.sprite.position.y <=-50){
                [self.removeEnemyList addObject:enemy];
                [self removeChild:enemy cleanup:YES];
            }
        }
        if(bullet.sprite.position.y > 500){
            [self.removeBulletList addObject:bullet];
            [self.player removeChild:bullet.sprite cleanup:YES];
        }
    }
    //NSLog(@"===%i",[self.bulletList count]);
    [self.enemyList removeObjectsInArray:self.removeEnemyList];
    [self.removeEnemyList removeAllObjects];
    [self.bulletList removeObjectsInArray:self.removeBulletList];
    [self.removeBulletList removeAllObjects];
}

- (void) removeEnemy:(GameObject *)enemy{
    [NSThread sleepForTimeInterval:.5];
    
    [self removeChild:enemy cleanup:YES];
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

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint p1 = [touch locationInView:nil];
    [self.player.player setPosition:CGPointMake(p1.x, 480-p1.y)];

}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //[[CCDirector sharedDirector] pause];
}


@end

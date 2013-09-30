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
        [self schedule:@selector(update)];
    }
    return self;
};

- (void)createSprite{
    Background *bg = [[Background alloc] init];
    [self addChild:bg];
    
    self.player = [[Player alloc] init];
    [self addChild:self.player];
    
}

- (void)createEnemy{
    EnemyBigPlane *big = [[EnemyBigPlane alloc] init];
    [self addChild:big];
    NSLog(@"%zi", big.sprite.position.x);
    [self.enemyList addObject:big];
}

- (void)update{
    
    //GameObject *enemy = [self.enemyList objectAtIndex:0];
    //CGPoint pointer = [enemy.sprite position];
    //NSLog(@"%f, %f", pointer.x, pointer.y);
    //CGRect rect = [enemy.sprite textureRect];
    //NSLog(@"%f, %f", rect.origin.x, rect.origin.y);
    //NSLog(@"%f, %f", rect.size.width, rect.size.height);
    GameObject *enemy = [self.enemyList objectAtIndex:0];
    CGRect playerRect = CGRectMake(self.player.player.position.x, self.player.player.position.y, [self.player.player textureRect].size.width, [self.player.player textureRect].size.height);
    CGRect enemyRect = CGRectMake(enemy.sprite.position.x, enemy.sprite.position.y, enemy.sprite.textureRect.size.width, enemy.sprite.textureRect.size.height);
    [self isCollision:playerRect :enemyRect];
    
    //CGRectIntersectsRect(<#CGRect rect1#>, <#CGRect rect2#>)
    //CGRectContainsRect(<#CGRect rect1#>, <#CGRect rect2#>)
}

- (BOOL)isCollision: (CGRect)rect1 :(CGRect)rect2{
    CGPoint point1 = rect1.origin;
    CGPoint point2 = rect2.origin;
    CGSize size1 = rect1.size;
    CGSize size2 = rect2.size;
    CGPoint minPoint = CGPointMake(fabs(point1.x-point2.x), fabs(point1.y-point2.y));
    CGPoint actPoint = CGPointMake(fabs(size1.width-size2.width), fabs(size1.height-size2.height));
    NSLog(@"%f, %f   %f,%f");
    if (minPoint.x > actPoint.x && minPoint.y > minPoint.y) {
        NSLog(@"11111");
    }
    return NO;
}

@end

//
//  NCScene.m
//  Playground
//
//  Created by Maher Rezeq on 2/28/15.
//  Copyright (c) 2015 Maher Rezeq. All rights reserved.
//

#import "NCScene.h"
//#import "Shape.h"
#import "NCLevel.h"

@interface NCScene () <MainSceneInterfaceControllerDelegate>
@property (nonatomic,strong) NCLevel * level;
@end

@implementation NCScene

- (void)willActivate {
   
    [self.mainScreenDelegate clearScreen];
    
    self.level = [[NCLevel alloc] initWithFile:@"Level_0"];
    self.level.drawerDelegate =  (id<NCMainSceneDrawerDelegate>)self;
    [self.level addTiles];
    
}

- (void)drawTile:(NCTile *)tile {
    if (tile && tile.point) {
        [self.mainScreenDelegate drawPoint:tile.point];
    }
}

- (void)selectedPointAtRow:(int)row column:(int)column {
    [self.level removeMatchesAtRow:row column:column];
    
}

@end

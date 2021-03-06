//
//  NCScene.h
//  Playground
//
//  Created by Maher Rezeq on 2/28/15.
//  Copyright (c) 2015 Maher Rezeq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NCMainScreenDelegate.h"
#import "NCTile.h"

@protocol NCMainSceneDrawerDelegate <NSObject>

@required
- (void)drawTile:(NCTile *)tile;

@end

@interface NCScene : NSObject

@property (nonatomic, weak) id <MainScreenDelegate> mainScreenDelegate;

@end

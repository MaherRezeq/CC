//
//  NCLevel.h
//  Playground
//
//  Created by Maher Rezeq on 3/3/15.
//  Copyright (c) 2015 Native & Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NCScene.h"

static const NSInteger kNumColumns = 9;
static const NSInteger kNumRows = 9;

@interface NCLevel : NSObject

@property (nonatomic, weak) id <NCMainSceneDrawerDelegate> drawerDelegate;
// Create a level by loading it from a file.
- (instancetype)initWithFile:(NSString *)filename;
- (void)addTiles;
- (void)removeMatchesAtRow:(int)row column:(int)column;
@end

//
//  NCTile.h
//  Playground
//
//  Created by Maher Rezeq on 3/3/15.
//  Copyright (c) 2015 Native & Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iPoint.h"
#import "NCCookie.h"

@interface NCTile : NSObject

@property (nonatomic,strong) iPoint *point;
@property (nonatomic,strong) NCCookie *cookie;
- (instancetype)initWithRow:(int)row column:(int)column;

@end

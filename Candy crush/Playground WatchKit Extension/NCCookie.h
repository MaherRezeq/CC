//
//  RWTCookie.h
//  CookieCrunch
//
//  Created by Matthijs on 25-02-14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

static const NSUInteger NumCookieTypes = 5;

@interface NCCookie : NSObject

@property (assign, nonatomic) NSInteger column;
@property (assign, nonatomic) NSInteger row;
@property (assign, nonatomic) NSUInteger cookieType;  // 1 - 6

- (NSString *)cookieName;
- (NSString *)highlightedSpriteName;

@end

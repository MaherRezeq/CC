//
//  NCLevel.m
//  Playground
//
//  Created by Maher Rezeq on 3/3/15.
//  Copyright (c) 2015 Native & Creative. All rights reserved.
//

#import "NCLevel.h"
#import "NCTile.h"
#import "NCCookie.h"
#import "NCChain.h"

@interface NCLevel ()
{
    // The 2D array that contains the layout of the level.
    NCTile *_tiles[kNumColumns][kNumRows];
}
@end

@implementation NCLevel
#pragma mark - Level Loading

- (instancetype)initWithFile:(NSString *)filename {
    self = [super init];
    if (self != nil) {
        NSDictionary *dictionary = [self loadJSON:filename];
        
        // The dictionary contains an array named "tiles". This array contains one
        // element for each row of the level. Each of those row elements in turn is
        // also an array describing the columns in that row. If a column is 1, it
        // means there is a tile at that location, 0 means there is not.
        
        // Loop through the rows...
        [dictionary[@"tiles"] enumerateObjectsUsingBlock:^(NSArray *array, NSUInteger row, BOOL *stop) {
            
            // Loop through the columns in the current row...
            [array enumerateObjectsUsingBlock:^(NSNumber *value, NSUInteger column, BOOL *stop) {
                
                // Note: In Sprite Kit (0,0) is at the bottom of the screen,
                // so we need to read this file upside down.
                NSInteger tileRow = kNumRows - row - 1;
                
                // If the value is 1, create a tile object.
                if ([value integerValue] == 1) {
                    _tiles[column][tileRow] = [[NCTile alloc] initWithRow:(int)row column:(int)column];
                }
            }];
        }];
        
    }
    return self;
}


- (NSDictionary *)loadJSON:(NSString *)filename {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:@"json"];
    if (path == nil) {
        NSLog(@"Could not find level file: %@", filename);
        return nil;
    }
    
    NSError *error;
    NSData *data = [NSData dataWithContentsOfFile:path options:0 error:&error];
    if (data == nil) {
        NSLog(@"Could not load level file: %@, error: %@", filename, error);
        return nil;
    }
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (dictionary == nil || ![dictionary isKindOfClass:[NSDictionary class]]) {
        NSLog(@"Level file '%@' is not valid JSON: %@", filename, error);
        return nil;
    }
    
    return dictionary;
}

- (void)addTiles {
    
    // The tile pattern is drawn *in between* the level tiles. That's why
    // there is an extra column and row of them.
    for (NSInteger row = 0; row < kNumRows; row++) {
        for (NSInteger column = 0; column < kNumColumns; column++) {
            
            BOOL topLeft     = (column > 0)          && (row < kNumRows) && [self tileAtColumn:column - 1 row:row];
            BOOL bottomLeft  = (column > 0)          && (row > 0)       && [self tileAtColumn:column - 1 row:row - 1];
            BOOL topRight    = (column < kNumColumns) && (row < kNumRows) && [self tileAtColumn:column     row:row];
            BOOL bottomRight = (column < kNumColumns) && (row > 0)       && [self tileAtColumn:column     row:row - 1];
            
            // The tiles are named from 0 to 15, according to the bitmask that is
            // made by combining these four values.
            NSUInteger value = topLeft | topRight << 1 | bottomLeft << 2 | bottomRight << 3;
            
            // Values 0 (no tiles), 6 and 9 (two opposite tiles) are not drawn.
            if (value != 0 && value != 6 && value != 9) {
                
                NCTile *tile = [self tileAtColumn:column row:row];
                if (tile) {
                    //NSString *name = [NSString stringWithFormat:@"Tile_%lu", (long)value];
                    NSUInteger newCookieType = arc4random_uniform(NumCookieTypes) + 1;
                    NCCookie *cookie = [self createCookieAtColumn:column row:row withType:newCookieType];
                    tile.cookie = cookie;
                    tile.point.image = [cookie cookieName];
                    [self.drawerDelegate drawTile:tile];
                }
                
            }
        }
    }
    
//    [NSTimer scheduledTimerWithTimeInterval:2.0
//                                     target:self
//                                   selector:@selector(removeMatches)
//                                   userInfo:nil
//                                    repeats:NO];
}

#pragma mark - Querying the Level

- (NCTile *)tileAtColumn:(NSInteger)column row:(NSInteger)row {
    NSAssert1(column >= 0 && column < kNumColumns, @"Invalid column: %ld", (long)column);
    NSAssert1(row >= 0 && row < kNumRows, @"Invalid row: %ld", (long)row);
    NCTile *tile = _tiles[column][row];
    return tile;
}

- (NCCookie *)createCookieAtColumn:(NSInteger)column row:(NSInteger)row withType:(NSUInteger)cookieType {
    NCCookie *cookie = [[NCCookie alloc] init];
    cookie.cookieType = cookieType;
    cookie.column = column;
    cookie.row = row;
    return cookie;
}


#pragma mark - Detecting Matches

- (void)removeMatchesAtRow:(int)row column:(int)column {
    
    NCChain *horizontalChainsRight = [self detectRightHorizontalMatchesForRow:row column:column];
    NCChain *horizontalChainsLeft = [self detectLeftHorizontalMatchesForRow:row column:column];
    
    NCChain *verticalChainsUp = [self detectUptVerticalMatchesForRow:row column:column];
    NCChain *verticalChainsDown = [self detectDowntVerticalMatchesForRow:row column:column];
    
    for (NCCookie *c in horizontalChainsRight.cookies) {
        
        NCTile *tile = [self tileAtColumn:c.column row:c.row];
        tile.cookie = nil;

        tile.point.color = [UIColor redColor];
        tile.point.image = nil;
        
        [self.drawerDelegate drawTile:tile];
        
    }
    
    for (NCCookie *c in horizontalChainsLeft.cookies) {
        
        NCTile *tile = [self tileAtColumn:c.column row:c.row];
        tile.cookie = nil;

        tile.point.color = [UIColor whiteColor];
        tile.point.image = nil;
        
        [self.drawerDelegate drawTile:tile];
        
    }
    
    for (NCCookie *c in verticalChainsUp.cookies) {
        
        NCTile *tile = [self tileAtColumn:c.column row:c.row];
        tile.cookie = nil;

        tile.point.color = [UIColor blueColor];
        tile.point.image = nil;
        
        [self.drawerDelegate drawTile:tile];
        
    }
    
    for (NCCookie *c in verticalChainsDown.cookies) {
        
        NCTile *tile = [self tileAtColumn:c.column row:c.row];
        tile.cookie = nil;
        tile.point.color = [UIColor yellowColor];
        tile.point.image = nil;
        
        [self.drawerDelegate drawTile:tile];
        
    }
    
    [self fillHoles];
    [self redrawTheScreen];
    // Note: to detect more advanced patterns such as an L shape, you can see
    // whether a cookie is in both the horizontal & vertical chains sets and
    // whether it is the first or last in the array (at a corner). Then you
    // create a new RWTChain object with the new type and remove the other two.
    /*
     [self removeCookies:horizontalChains];
     [self removeCookies:verticalChains];
     
     [self calculateScores:horizontalChains];
     [self calculateScores:verticalChains];
     */
    // return [horizontalChains setByAddingObjectsFromSet:verticalChains];
}

- (void) redrawTheScreen {
    
    for (NSInteger column = 0; column < kNumColumns; column++) {
        
        for (NSInteger row = 0; row < kNumRows; row++) {
            
            NCTile *tile = [self tileAtColumn:column row:row];
            
            [self.drawerDelegate drawTile:tile];
        }
    }
    
            
}
- (void)fillHoles {
    NSMutableArray *columns = [NSMutableArray array];
    
    // Loop through the rows, from bottom to top. It's handy that our row 0 is
    // at the bottom already. Because we're scanning from bottom to top, this
    // automatically causes an entire stack to fall down to fill up a hole.
    // We scan one column at a time.
    for (NSInteger column = 0; column < kNumColumns; column++) {
        
        NSMutableArray *array;
        for (NSInteger row = 0; row < kNumRows; row++) {
            
            // If there is a tile at this position but no cookie, then there's a hole.
            if (_tiles[column][row] != nil && _tiles[column][row].cookie == nil) {
                
                // Scan upward to find a cookie.
                for (NSInteger lookup = row + 1; lookup < kNumRows; lookup++) {
                    NCCookie *cookie = _tiles[column][lookup].cookie ;
                    if (cookie != nil) {
                        // Swap that cookie with the hole.
                        _tiles[column][lookup].cookie  = nil;
                        _tiles[column][row].cookie  = cookie;
                        cookie.row = row;
                        
                        // For each column, we return an array with the cookies that have
                        // fallen down. Cookies that are lower on the screen are first in
                        // the array. We need an array to keep this order intact, so the
                        // animation code can apply the correct kind of delay.
                        if (array == nil) {
                            array = [NSMutableArray array];
                            [columns addObject:array];
                        }
                        [array addObject:cookie];
                        
                        // Don't need to scan up any further.
                        break;
                    }
                }
            }
        }
    }
    return ;
}


- (NCChain *)detectRightHorizontalMatchesForRow:(NSUInteger)row column:(NSUInteger)column {
    // Contains the RWTCookie objects that were part of a horizontal chain.
    // If there is a cookie/tile at this position...
    NSUInteger current = column;
    // ...then add all the cookies from this chain into the set.
    NCChain *chain = [[NCChain alloc] init];
    chain.chainType = ChainTypeHorizontal;
    if (_tiles[column][row] != nil) {

        NSUInteger matchType = _tiles[column][row].cookie.cookieType;
        current +=1;
        while (current < kNumColumns && _tiles[current][row] && _tiles[current][row].cookie.cookieType == matchType) {
            [chain addCookie:_tiles[current][row].cookie];
            current +=1;
        }
    }
    return chain;
}

- (NCChain *)detectLeftHorizontalMatchesForRow:(NSUInteger)row column:(NSUInteger)column {
    // Contains the RWTCookie objects that were part of a horizontal chain.
    // If there is a cookie/tile at this position...
    int current = (int)column;
    // ...then add all the cookies from this chain into the set.
    NCChain *chain = [[NCChain alloc] init];
    chain.chainType = ChainTypeHorizontal;
    
    if (_tiles[column][row] != nil) {
        NSUInteger matchType = _tiles[column][row].cookie.cookieType;
        current -=1;
        while (current >= 0 && _tiles[current][row] && _tiles[current][row].cookie.cookieType == matchType) {
            [chain addCookie:_tiles[current][row].cookie];
            current -=1;
            
        }
    }
    return chain;
}

- (NCChain *)detectUptVerticalMatchesForRow:(NSUInteger)row column:(NSUInteger)column {
    // Contains the RWTCookie objects that were part of a horizontal chain.
    // If there is a cookie/tile at this position...
    NSUInteger current = row;
    // ...then add all the cookies from this chain into the set.
    NCChain *chain = [[NCChain alloc] init];
    chain.chainType = ChainTypeHorizontal;
    if (_tiles[column][row] != nil) {
        
        NSUInteger matchType = _tiles[column][row].cookie.cookieType;
        current +=1;
        while (current < kNumColumns && _tiles[column][current] && _tiles[column][current].cookie.cookieType == matchType) {
            [chain addCookie:_tiles[column][current].cookie];
            current +=1;
        }
    }
    return chain;
}

- (NCChain *)detectDowntVerticalMatchesForRow:(NSUInteger)row column:(NSUInteger)column {
    // Contains the RWTCookie objects that were part of a horizontal chain.
    // If there is a cookie/tile at this position...
    int current = (int)row;
    // ...then add all the cookies from this chain into the set.
    NCChain *chain = [[NCChain alloc] init];
    chain.chainType = ChainTypeHorizontal;
    
    if (_tiles[column][row] != nil) {
        NSUInteger matchType = _tiles[column][row].cookie.cookieType;
        current -=1;
        while (current >= 0 && _tiles[column][current] && _tiles[column][current].cookie.cookieType == matchType) {
            [chain addCookie:_tiles[column][current].cookie];
            current -=1;
            
        }
    }
    return chain;
}
@end

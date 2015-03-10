//
//  NCTile.m
//  Playground
//
//  Created by Maher Rezeq on 3/3/15.
//  Copyright (c) 2015 Native & Creative. All rights reserved.
//

#import "NCTile.h"

@implementation NCTile

- (instancetype)initWithRow:(int)row column:(int)column {
    
    self = [super init];
    if (self) {
        _point = [iPoint new];
        _point.location = [self locationForRow:row column:column];
    }
    return self;
}

- (NSString *)locationForRow:(int)row column:(int)column {
    
    //char to int ASCII-code
    char c = 'a';
    int asciiCode = (int)c;
    asciiCode += row;
    return [NSString stringWithFormat:@"%c%d", asciiCode, column];;
}
@end

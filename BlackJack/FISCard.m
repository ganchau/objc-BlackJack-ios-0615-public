//
//  FISCard.m
//  BlackJack
//
//  Created by Gan Chau on 5/28/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "FISCard.h"

@implementation FISCard

- (NSString *)description
{
    return @"";
}

- (instancetype)init
{
    return [self initWithMatched:NO faceUp:NO];
}

// designated initializer
- (instancetype)initWithMatched:(BOOL)matched faceUp:(BOOL)faceUp
{
    self = [super init];
    
    if (self) {
        _matched = matched;
        _faceUp = faceUp;
    }
    
    return self;
}

- (void)flipCard
{
    self.faceUp = !self.isFaceUp;
}

@end

//
//  FISDeck.m
//  BlackJack
//
//  Created by Gan Chau on 5/28/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "FISDeck.h"

@implementation FISDeck

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _cards = [@[] mutableCopy];
    }
    
    return self;
}

- (FISCard *)drawRandomCard
{
    FISCard *randomCard = [[FISCard alloc] init];
    
    if (self.cards.count > 0) {
        NSUInteger randomIndex = arc4random_uniform((unsigned)self.cards.count);
        randomCard = self.cards[randomIndex];
        [self.cards removeObjectAtIndex:randomIndex];
    }
    return randomCard;
}

@end

//
//  FISPlayingCardDeck.m
//  BlackJack
//
//  Created by Gan Chau on 5/28/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "FISPlayingCardDeck.h"

@implementation FISPlayingCardDeck

- (instancetype)init
{
    self = [super init];
        
    if (self) {
        _cards = [@[] mutableCopy];
        
        for (NSString *suit in [FISPlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank < [FISPlayingCard validRanks].count; rank++) {
                FISPlayingCard *card = [[FISPlayingCard alloc] initWithSuit:suit rank:@(rank)];
                [self.cards addObject:card];
            }
        }
    }
    
    return self;
}

- (FISPlayingCard *)drawRandomCard
{
    FISPlayingCard *randomCard = [[FISPlayingCard alloc] init];
    
    if (self.cards.count > 0) {
        NSUInteger randomIndex = arc4random_uniform((unsigned)self.cards.count);
        randomCard = self.cards[randomIndex];
        [self.cards removeObjectAtIndex:randomIndex];
    }
    return randomCard;
}


@end

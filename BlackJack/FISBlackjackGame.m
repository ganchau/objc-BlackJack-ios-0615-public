//
//  FISBlackjackGame.m
//  Blackjack
//
//  Created by Gan Chau on 5/29/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"

@implementation FISBlackjackGame

- (instancetype)init
{
    self = [self initUsingDeck:[[FISPlayingCardDeck alloc] init]];
        
    return self;
}

// designated initializer
- (instancetype)initUsingDeck:(FISPlayingCardDeck *)deck
{
    self = [super init];
    
    if (self) {
        _playingCardDeck = deck;
        _handScore = @0;
        _hand = [@[] mutableCopy];
        _isBusted = NO;
        _isBlackjack = NO;
    }
    
    return self;
    
}

- (BOOL)isBlackjack
{
    if ([self.handScore integerValue] == 21) {
        return YES;
    }
    return NO;
    
}

- (BOOL)isBusted
{
    if ([self.handScore integerValue] > 21) {
        return YES;
    }
    return NO;
}

- (NSNumber *)handScore
{
    _handScore = @0;            // reset score to 0
    NSUInteger aceCards = 0;    // counter for Ace cards
    
    for (FISPlayingCard *card in self.hand) {
        if ([card.rank integerValue] == 1) {   // if Ace card encountered, increment counter
            aceCards++;
            _handScore = @([_handScore integerValue] + 1);  // add 1 to the hand score
        } else if ([card.rank integerValue] > 10) {         // if Face card encountered,
            _handScore = @([_handScore integerValue] + 10); // add 10 to the hand score
        } else {                                            // otherwise, add the rank value to the hand score
            _handScore = @([_handScore integerValue] + [card.rank integerValue]);
        }
    }
    
    if (aceCards > 0) {     // if there are any Ace card found
        for (NSUInteger i=0; i<=aceCards; i++) {
            if ([_handScore integerValue] + 10 <= 21) {         // if adding 10 (in addition to 1 previously) doesn't bust
                _handScore = @([_handScore integerValue] + 10); // then add 10 to the handscore, otherwise leave it be
            }
        }
    }
    
    return _handScore;
}

- (void)drawCard
{
    FISPlayingCard *randomCard = [self.playingCardDeck drawRandomCard];
    [self.hand addObject:randomCard];
}

- (void)deal
{
    while (self.hand.count < 2) {
        [self drawCard];
    }
}

- (void)hit
{    
    if (self.hand.count > 0) {
        if (!self.isBusted) {
            [self drawCard];
        }
    }
}

@end

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
    self = [super init];
    
    if (self) {
        _playingCardDeck = [[FISPlayingCardDeck alloc] init];
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
    _handScore = @0;
    NSUInteger aceCards = 0;
    
    for (FISPlayingCard *card in self.hand) {
        if ([card.rank integerValue] == 1) {
            aceCards++;
            _handScore = @([_handScore integerValue] + 1);
        } else if ([card.rank integerValue] > 10) {
            _handScore = @([_handScore integerValue] + 10);
        } else {
            _handScore = @([_handScore integerValue] + [card.rank integerValue]);
        }
    }
    
    if (aceCards > 0) {
        for (NSUInteger i=0; i<=aceCards; i++) {
            if ([_handScore integerValue] + 10 <= 21) {
                _handScore = @([_handScore integerValue] + 10);
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

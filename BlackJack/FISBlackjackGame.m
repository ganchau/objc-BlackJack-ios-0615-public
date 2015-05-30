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
    for (FISPlayingCard *card in self.hand) {
        if ([card.rank integerValue] == 1) {
            if ([_handScore integerValue] + 11 <= 21) {
                _handScore = @([_handScore integerValue] + 11);
            } else {
                _handScore = @([_handScore integerValue] + 1);
            }
        } else if ([card.rank integerValue] > 10) {
            _handScore = @([_handScore integerValue] + 10);
        } else {
            _handScore = @([_handScore integerValue] + [card.rank integerValue]);
        }
    }
    NSLog(@"HAND SCORE: %@", _handScore);
    return _handScore;
}

- (void)drawCard
{
    FISCard *randomCard = [self.playingCardDeck drawRandomCard];
    [self.hand addObject:(FISPlayingCard *)randomCard];
}

- (void)deal
{
    while (self.hand.count < 2 && !self.isBusted) {
        [self drawCard];
    }
}

- (void)hit
{    
    if (self.hand.count >= 2 && !self.isBusted) {
        [self drawCard];
    }
}

@end

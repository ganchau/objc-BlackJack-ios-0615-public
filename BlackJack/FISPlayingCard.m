//
//  FISPlayingCard.m
//  BlackJack
//
//  Created by Gan Chau on 5/28/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "FISPlayingCard.h"

@implementation FISPlayingCard

+ (NSArray *)validRanks
{
    return @[@"*", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSArray *)validSuits
{
    return @[@"♥", @"♣", @"♠", @"♦"];
}

- (void)setRank:(NSNumber *)rank
{
    if ([rank integerValue] >= 0 && [rank integerValue] < [FISPlayingCard validRanks].count) {
        _rank = rank;
    } else {
        _rank = @0;
    }
}

- (void)setSuit:(NSString *)suit
{
    if ([[FISPlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    } else {
        _suit = @"";
    }
}

- (instancetype)init
{
    return [self initWithSuit:@"" rank:@0];
}

// designated initializer
- (instancetype)initWithSuit:(NSString *)suit rank:(NSNumber *)rank
{
    self = [super init];
    
    if (self) {
        if ([rank integerValue] >= 0 && [rank integerValue] < [FISPlayingCard validRanks].count) {
            _rank = rank;
        } else {
            _rank = @0;
        }
        if ([[FISPlayingCard validSuits] containsObject:suit]) {
            _suit = suit;
        } else {
            _suit = @"";
        }
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Rank:%@ Suit:%@", [FISPlayingCard validRanks][[self.rank integerValue]], self.suit];
}

@end

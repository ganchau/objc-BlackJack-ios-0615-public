//
//  FISBlackjackGame.h
//  Blackjack
//
//  Created by Gan Chau on 5/29/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISPlayingCardDeck.h"

@interface FISBlackjackGame : NSObject

@property (strong, nonatomic) FISPlayingCardDeck *playingCardDeck; // the playingCardDeck in use
@property (strong, nonatomic) NSNumber *handScore;  // returns the total value of cards in the hand. *Aces can be 1 or 11*
@property (strong, nonatomic) NSMutableArray *hand; // returns the cards in the hand
@property (nonatomic) BOOL isBusted;      // returns YES if handScore is more than 21
@property (nonatomic) BOOL isBlackjack;   // returns YES if handScore is 21

- (void)deal; // should deal 2 new cards and add those cards to the hand.
- (void)hit;  // should deal one additional card and add it card to the hand.
- (instancetype)initUsingDeck:(FISPlayingCardDeck *)deck;  // designated initializer

@end

//
//  FISPlayingCardDeck.h
//  BlackJack
//
//  Created by Gan Chau on 5/28/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISPlayingCard.h"

@interface FISPlayingCardDeck : NSObject

@property (strong, nonatomic) NSMutableArray *cards;

- (FISPlayingCard *)drawRandomCard;

@end

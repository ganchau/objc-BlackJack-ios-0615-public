//
//  FISCard.h
//  BlackJack
//
//  Created by Gan Chau on 5/28/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISCard : NSObject

@property (nonatomic) BOOL matched;
@property (nonatomic, getter=isFaceUp) BOOL faceUp;

// designated initializer
- (instancetype)initWithMatched:(BOOL)matched faceUp:(BOOL)faceUp;
- (void)flipCard;

@end

//
//  FISDeck.h
//  BlackJack
//
//  Created by Gan Chau on 5/28/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISCard.h"

@interface FISDeck : NSObject

@property (strong, nonatomic) NSMutableArray *cards;

- (FISCard *)drawRandomCard;

@end

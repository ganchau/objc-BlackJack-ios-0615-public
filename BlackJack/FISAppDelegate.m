//
//  FISAppDelegate.m
//  BlackJack
//
//  Created by Al Tyus on 6/9/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import "FISAppDelegate.h"
#import "FISBlackJackGame.h"

@implementation FISAppDelegate

- (void)outputResultsForPlayer:(FISBlackjackGame *)player
{
    static NSUInteger playerIndex = 1;  // static variable to keep track of current player # for NSLog
    NSString *handString = @"";
    if (player.isBlackjack) {
        handString = [player.hand componentsJoinedByString:@" "];
        NSLog(@"\nPlayer %lu: BLACK JACK!\nHand: %@\n\n", (unsigned long)playerIndex, handString);
    } else if (player.isBusted) {
        handString = [player.hand componentsJoinedByString:@" "];
        NSLog(@"\nPlayer %lu: BUSTED!\nHand score: %@\nHand: %@\n\n", (unsigned long)playerIndex, player.handScore, handString);
    }
    playerIndex++;   // increment to next player #
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // initialize a new game
    FISBlackjackGame *player1 = [[FISBlackjackGame alloc] init];
    
    // initialize a second game using the first game's deck
    FISBlackjackGame *player2 = [[FISBlackjackGame alloc] initUsingDeck:player1.playingCardDeck];
    
    [player1 deal];
    [player2 deal];
    
    while (!player1.isBusted && !player1.isBlackjack) {
        [player1 hit];
    }
    while (!player2.isBusted && !player2.isBlackjack) {
        [player2 hit];
    }
    
    [self outputResultsForPlayer:player1];
    [self outputResultsForPlayer:player2];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

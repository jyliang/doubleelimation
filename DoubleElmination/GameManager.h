//
//  GameManager.h
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import <Foundation/Foundation.h>
#import "Game.h"

@interface GameManager : NSObject

@property (nonatomic, strong) NSArray *games;

+ (GameManager *)sharedInstance;


- (void)populateInitialTeams:(NSArray *)teams;
- (Game *)getNextGame;
- (void)updateGame:(Game *)game withWinningTeam:(Team *)team;

@end

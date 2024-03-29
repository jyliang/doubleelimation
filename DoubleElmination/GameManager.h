//
//  GameManager.h
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import <Foundation/Foundation.h>
#import "Game.h"

@protocol GameManagerDelegate <NSObject>

- (void)updateGameMap;
- (void)declareWinner:(Team *)team;

@end

@interface GameManager : NSObject

@property (nonatomic, strong) NSArray *games;

@property (nonatomic, weak) id<GameManagerDelegate>delegate;

+ (GameManager *)sharedInstance;


- (void)populateInitialTeams:(NSArray *)teams;
- (Game *)getNextGame;
- (void)updateGame:(Game *)game withWinningTeam:(Team *)team;

@end

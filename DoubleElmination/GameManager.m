//
//  GameManager.m
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import "GameManager.h"
#import "NSArray+Additions.h"
#import "Team.h"
#import "Game.h"

@implementation GameManager

+ (GameManager *)sharedInstance {
    static GameManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[GameManager alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initGames];
    }
    return self;
}

- (NSInteger)getGameCount {
    return 15;
}

- (void)initGames {
    //total of 15 games?
    NSMutableArray *games = [NSMutableArray arrayWithCapacity:[self getGameCount]];
    for (int i = 0; i < [self getGameCount]; i++) {
        Game *game = [[Game alloc] init];
        [games addObject:game];
    }
    self.games = [games copy];
}

- (void)populateInitialTeams:(NSArray *)teams {
    NSMutableArray *allocationTeams = [NSMutableArray arrayWithArray:teams];
    Game *game;
    NSArray *pairTeams;
    for (int i = 0; i < teams.count/2; i++) {
        game = self.games[i];
        pairTeams = [allocationTeams getRandomObjects:2];
        game.team1 = pairTeams[0];
        game.team2 = pairTeams[1];
        [allocationTeams removeObjectsInArray:pairTeams];
    }
}

- (Game *)getNextGame {
    for (Game *game in self.games) {
        if (game.winningTeam == nil) {
            return game;
        }
    }
    return nil;
}

- (void)updateGame:(Game *)game withWinningTeam:(Team *)team {
    game.winningTeam = team;
    NSInteger i = [self.games indexOfObject:game] + 1;
    [self scheduleGame:i];
}

- (void)scheduleGame:(NSInteger)index {
    NSString *selName = [NSString stringWithFormat:@"scheduleResultForGame%ld", index];
    SEL selector = NSSelectorFromString(selName);
    [self performSelector:selector withObject:nil afterDelay:0];

}

//HARD CODE LOGIC FOR NOW DUE TO LIMITED UNDERSTAND OF THE GAME

- (void)scheduleResultForGame1 {
    Game *game = self.games[0];
    Game *gameForWinner = self.games[6];
    [gameForWinner addTeam:[game getWinner]];
    Game *gameForLoser = self.games[4];
    [gameForLoser addTeam:[game getLoser]];
}

- (void)scheduleResultForGame2 {
    Game *game = self.games[1];
    Game *gameForWinner = self.games[6];
    [gameForWinner addTeam:[game getWinner]];
    Game *gameForLoser = self.games[4];
    [gameForLoser addTeam:[game getLoser]];
}
- (void)scheduleResultForGame3 {
    Game *game = self.games[2];
    Game *gameForWinner = self.games[7];
    [gameForWinner addTeam:[game getWinner]];
    Game *gameForLoser = self.games[5];
    [gameForLoser addTeam:[game getLoser]];
}
- (void)scheduleResultForGame4 {
    Game *game = self.games[3];
    Game *gameForWinner = self.games[7];
    [gameForWinner addTeam:[game getWinner]];
    Game *gameForLoser = self.games[5];
    [gameForLoser addTeam:[game getLoser]];
}
- (void)scheduleResultForGame5 {
    Game *game = self.games[4];
    Game *gameForWinner = self.games[8];
    [gameForWinner addTeam:[game getWinner]];
}
- (void)scheduleResultForGame6 {
    Game *game = self.games[5];
    Game *gameForWinner = self.games[9];
    [gameForWinner addTeam:[game getWinner]];
    Game *gameForLoser = self.games[5];
    [gameForLoser addTeam:[game getLoser]];
}
- (void)scheduleResultForGame7 {
    Game *game = self.games[6];
    Game *gameForWinner = self.games[10];
    [gameForWinner addTeam:[game getWinner]];
    Game *gameForLoser = self.games[5];
    [gameForLoser addTeam:[game getLoser]];
}
- (void)scheduleResultForGame8 {
    Game *game = self.games[7];
    Game *gameForWinner = self.games[10];
    [gameForWinner addTeam:[game getWinner]];
    Game *gameForLoser = self.games[5];
    [gameForLoser addTeam:[game getLoser]];
}
- (void)scheduleResultForGame9 {
    Game *game = self.games[8];
    Game *gameForWinner = self.games[11];
    [gameForWinner addTeam:[game getWinner]];
    Game *gameForLoser = self.games[5];
    [gameForLoser addTeam:[game getLoser]];
}
- (void)scheduleResultForGame10 {
    Game *game = self.games[9];
    Game *gameForWinner = self.games[11];
    [gameForWinner addTeam:[game getWinner]];
    Game *gameForLoser = self.games[5];
    [gameForLoser addTeam:[game getLoser]];
}
- (void)scheduleResultForGame11 {
    Game *game = self.games[10];
    Game *gameForWinner = self.games[13];
    [gameForWinner addTeam:[game getWinner]];
    Game *gameForLoser = self.games[5];
    [gameForLoser addTeam:[game getLoser]];
}
- (void)scheduleResultForGame12 {
    Game *game = self.games[11];
    Game *gameForWinner = self.games[12];
    [gameForWinner addTeam:[game getWinner]];
    Game *gameForLoser = self.games[5];
    [gameForLoser addTeam:[game getLoser]];
}
- (void)scheduleResultForGame13 {
    Game *game = self.games[12];
    Game *gameForWinner = self.games[13];
    [gameForWinner addTeam:[game getWinner]];
    Game *gameForLoser = self.games[5];
    [gameForLoser addTeam:[game getLoser]];
}
- (void)scheduleResultForGame14 {
    Game *game = self.games[13];
    if ([self isFirstLoss:[game getLoser]]) {
        Game *game = self.games[14];
        [game addTeam:[game getWinner]];
        [game addTeam:[game getLoser]];
    } else {
        [Utility showAlertMessage:@"won!"];
    }
}

- (BOOL)isFirstLoss:(Team *)team {
    NSInteger lossCount = 0;
    for (Game *game in self.games) {
        if (game.getLoser.teamId == team.teamId) {
            lossCount ++;
        }
    }
    if (lossCount == 1) {
        return YES;
    }
    return NO;
}

- (void)scheduleResultForGame15 {
    [Utility showAlertMessage:@"won!"];
}



@end

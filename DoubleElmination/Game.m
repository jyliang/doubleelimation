//
//  Game.m
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import "Game.h"

@implementation Game

- (Team *)getWinner {
    if (self.winningTeam) {
        return self.winningTeam;
    }
    return nil;
}
- (Team *)getLoser {
    if (self.winningTeam) {
        return self.winningTeam == self.team1 ? self.team2 : self.team1;
    }
    return nil;
}

- (void)addTeam:(Team *)team {
    if (!self.team1) {
        self.team1 = team;
    } else if (!self.team2) {
        self.team2 = team;
    } else {
        [Utility showAlertMessage:@"something went wrong!"];
    }
}

@end

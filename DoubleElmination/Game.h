//
//  Game.h
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import <Foundation/Foundation.h>

@class Team;

@interface Game : NSObject

@property (nonatomic, strong) Team *Team1;
@property (nonatomic, strong) Team *Team2;
@property (nonatomic, strong) Team *winningTeam; //is nill when the game is not played yet

@end

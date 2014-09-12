//
//  GameManager.m
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import "GameManager.h"

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

    }
    return self;
}

- (void)initGames {
    
}

- (void)populateInitialTeams {

}

+ (Game *)getNextGame {
    return nil;
}

@end

//
//  TeamManager.h
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import <Foundation/Foundation.h>

@interface TeamManager : NSObject

@property (nonatomic, strong) NSArray *teams;

+ (TeamManager *)sharedInstance;

- (void)getTeamsWithCompletion:(void (^)(id))completion;

@end

//
//  TeamManager.m
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import "TeamManager.h"
#import "AFNetworking.h"
#import "Team.h"

@implementation TeamManager

+ (TeamManager *)sharedInstance {
    static TeamManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[TeamManager alloc] init];
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

- (void)getTeamsWithCompletion:(void (^)(id))completion {

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:@"http://example.com/resources.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
//    return;

    NSString *teamUrl = @"https://s3.amazonaws.com/misc­withbuddies.com/ClientChallenge/client­data­file.json";

    NSString *testUrl = @"https://scrapapp-templates-development.s3.amazonaws.com/test/client-data-file.json";

    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:testUrl]];

    AFHTTPRequestOperation *operation = [manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([ValidationUtility isValidDictionary:responseObject]) {
            NSString *error = responseObject[@"error"];
            if ((!error || [error isEqual:[NSNull null]])) {
                [self parseTeams:responseObject];
            }
        }

        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

    [manager.operationQueue addOperation:operation];



//    [manager GET:teamUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
}

- (void)parseTeams:(NSDictionary *)response {
    NSArray *teamsData = response[@"data"];
    Team *team;
    if ([ValidationUtility isValidArray:teamsData]) {
        NSMutableArray *allTeams = [NSMutableArray array];
        for (NSDictionary *teamDict in teamsData) {
            team = [[Team alloc] initWithDicitonary:teamDict];
            if (team) {
                [allTeams addObject:team];
            }
        }
        self.teams = [allTeams copy];
    }

}

@end

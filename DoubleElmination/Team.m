//
//  Team.m
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import "Team.h"

@implementation Team

- (instancetype)initWithDicitonary:(NSDictionary *)teamDictionary
{
    self = [super init];
    if (self) {
        NSNumber *number = teamDictionary[@"id"];
        if ([ValidationUtility isValidNumber:number]) {
            self.teamId = [number integerValue];
        } else {
            self.teamId = -1; //assume this is part of the spec where -1 is not a valid team id.
        }
        self.name = teamDictionary[@"name"];
        self.imageUrlString = teamDictionary[@"image"];
        if (![self isValid]) {
            return nil;
        }
    }
    return self;
}

- (BOOL)isValid {
    BOOL isValid = YES;
    isValid &= self.teamId >=0;
    isValid &= [ValidationUtility isValidLengthString:self.name];
    return isValid;
}

@end

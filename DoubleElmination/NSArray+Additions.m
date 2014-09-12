//
//  NSArray+Additions.m
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import "NSArray+Additions.h"

@implementation NSArray (Additions)

- (id)getObjectAtRandomIndex {
    if (self.count == 0) {
        return nil;
    }
    NSInteger randomIndex = arc4random()%self.count;
    return self[randomIndex];
}

- (NSArray *)getRandomObjects:(NSInteger)numberOfObjects {
    if (numberOfObjects == 0 || self.count == 0) {
        return @[];
    }
    if (numberOfObjects == 1) {
        return @[[self getObjectAtRandomIndex]];
    }

    if (numberOfObjects >= self.count) {
        return self;
    }

    NSMutableArray *objects = [self mutableCopy];
    NSMutableArray *selectedObjects = [NSMutableArray array];
    while (selectedObjects.count < numberOfObjects && objects.count > 0) {
        NSObject *object = [objects getObjectAtRandomIndex];
        [objects removeObject:object];
        [selectedObjects addObject:object];
    }
    return selectedObjects;
}

@end

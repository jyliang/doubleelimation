//
//  Team.h
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import <Foundation/Foundation.h>

@interface Team : NSObject

@property (nonatomic) NSInteger teamId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *imageUrlString;

- (instancetype)initWithDicitonary:(NSDictionary *)teamDictionary;

@end

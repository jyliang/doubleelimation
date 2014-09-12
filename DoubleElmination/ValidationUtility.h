//
//  ValidationUtility.h
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import <Foundation/Foundation.h>

@interface ValidationUtility : NSObject

+ (BOOL)isValidArray:(NSObject*)object;
+ (BOOL)isValidDictionary:(NSObject*)object;
+ (BOOL)isValidNumber:(NSObject*)object;
+ (BOOL)isValidString:(NSObject*)object;
+ (BOOL)isValidLengthString:(NSObject*)object;

@end

//
//  Utility.m
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import "Utility.h"

@implementation Utility

+ (void)showAlertMessage:(NSString *)message {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];
}

@end

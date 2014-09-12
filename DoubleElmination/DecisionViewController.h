//
//  DecisionViewController.h
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import <UIKit/UIKit.h>

@protocol DecisionViewControllerDelegate <NSObject>

- (void)didSelectTeam;

@end

@interface DecisionViewController : UIViewController

@property (nonatomic, weak) id<DecisionViewControllerDelegate>decisionDelegate;

- (IBAction)team1Selected:(id)sender;
- (IBAction)team2Selected:(id)sender;

@end

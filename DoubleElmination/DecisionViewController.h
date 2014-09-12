//
//  DecisionViewController.h
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import <UIKit/UIKit.h>

@class Game;
@class Team;
@protocol DecisionViewControllerDelegate <NSObject>

- (void)didSelectTeam:(Team *)team forGame:(Game *)game;

@end

@interface DecisionViewController : UIViewController

@property (nonatomic, weak) id<DecisionViewControllerDelegate>decisionDelegate;
@property (nonatomic, strong) Game *game;
@property (weak, nonatomic) IBOutlet UIImageView *team1ImageView;
@property (weak, nonatomic) IBOutlet UILabel *team1Label;
@property (weak, nonatomic) IBOutlet UIImageView *team2ImageView;
@property (weak, nonatomic) IBOutlet UILabel *team2Label;

- (IBAction)team1Selected:(id)sender;
- (IBAction)team2Selected:(id)sender;

@end

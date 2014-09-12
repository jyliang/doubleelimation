//
//  DecisionViewController.m
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import "DecisionViewController.h"
#import "UIImageView+AFNetworking.h"
#import "Game.h"
#import "Team.h"

@interface DecisionViewController ()

@end

@implementation DecisionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadGame];

}

- (void)loadGame {
    [self.team1ImageView setImageWithURL:[NSURL URLWithString:self.game.team1.imageUrlString]];
    [self.team1Label setText:self.game.team1.name];
    [self.team2ImageView setImageWithURL:[NSURL URLWithString:self.game.team2.imageUrlString]];
    [self.team2Label setText:self.game.team2.name];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)team1Selected:(id)sender {
    [self.decisionDelegate didSelectTeam:self.game.team1 forGame:self.game];
}

- (IBAction)team2Selected:(id)sender {
    [self.decisionDelegate didSelectTeam:self.game.team2 forGame:self.game];
}
@end

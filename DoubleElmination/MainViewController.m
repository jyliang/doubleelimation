//
//  MainViewController.m
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import "MainViewController.h"
#import "DecisionViewController.h"
#import "TeamManager.h"
#import "GameManager.h"
#import "TeamImageView.h"
#import "Team.h"

#define kSegueIdentifierDecision @"decision"

@interface MainViewController () <DecisionViewControllerDelegate, UIScrollViewDelegate, GameManagerDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) TeamImageView *bracketImageView;

@end

@implementation MainViewController

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
    [self initBracketImageView];
    [[TeamManager sharedInstance] getTeamsWithCompletion:^(id object) {
        NSArray *teams = [[TeamManager sharedInstance] teams];
        if (teams.count == 8) {
            [[GameManager sharedInstance] populateInitialTeams: teams];
            [self.bracketImageView updateTeams];
        } else {
            [Utility showAlertMessage:@"Did not get 8 teams!"];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initBracketImageView {
    UIImage *bracketImage = [UIImage imageNamed:@"bracket"];
    self.bracketImageView = [[TeamImageView alloc] initWithImage:bracketImage];
    [self.scrollView addSubview:self.bracketImageView];
    self.scrollView.maximumZoomScale = 2;
    CGFloat minimumZoomScale = MIN(CGRectGetWidth(self.scrollView.frame)/bracketImage.size.width,CGRectGetHeight(self.scrollView.frame)/bracketImage.size.height);
    self.scrollView.minimumZoomScale = minimumZoomScale;
    self.scrollView.delegate = self;
    [self.scrollView setZoomScale:minimumZoomScale];


    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [view setBackgroundColor:[UIColor redColor]];

    [self.bracketImageView addSubview:view];
    [self.bracketImageView drawTeams];
    [GameManager sharedInstance].delegate = self;
}


#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:kSegueIdentifierDecision]) {
        DecisionViewController *vc = (DecisionViewController *)segue.destinationViewController;
        Game *nextGame = (Game *)sender;
        vc.game = nextGame;
        vc.decisionDelegate = self;
    }
}


#pragma mark - Actions
- (IBAction)playButtonTapped:(id)sender {
    Game *nextGame = [[GameManager sharedInstance] getNextGame];
    if (nextGame) {
        [self performSegueWithIdentifier:kSegueIdentifierDecision sender:nextGame];
    } else {
        [self restartGame];
    }
}

- (void)restartGame {
    [[GameManager sharedInstance] populateInitialTeams:[TeamManager sharedInstance].teams];
    [self.bracketImageView drawTeams];
    [self.bracketImageView updateTeams];
}

#pragma mark - DecisionViewControllerDelegate
- (void)didSelectTeam:(Team *)team forGame:(Game *)game {
    [[GameManager sharedInstance] updateGame:game withWinningTeam:team];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UISCrollViewDelegate
- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.bracketImageView;
}

#pragma mark - GameManagerDelegate

- (void)updateGameMap {
    [self.bracketImageView updateTeams];
}

- (void)declareWinner:(Team *)team {
    NSString *title = [NSString stringWithFormat:@"Team %@ Wins!", team.name];
    NSString *message = [NSString stringWithFormat:@"Team %@ was the tournament winner!! Play again?", team.name];

    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    [alertView show];

}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self restartGame];
    }
}

@end

//
//  MainViewController.m
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import "MainViewController.h"
#import "DecisionViewController.h"

#define kSegueIdentifierDecision @"decision"

@interface MainViewController () <DecisionViewControllerDelegate>

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:kSegueIdentifierDecision]) {
        DecisionViewController *vc = (DecisionViewController *)segue.destinationViewController;
        vc.decisionDelegate = self;
    }
}


#pragma mark - Actions
- (IBAction)playButtonTapped:(id)sender {
    [self performSegueWithIdentifier:kSegueIdentifierDecision sender:nil];
}

#pragma mark - DecisionViewControllerDelegate
- (void)didSelectTeam {
    [self.navigationController popViewControllerAnimated:YES];
}

@end

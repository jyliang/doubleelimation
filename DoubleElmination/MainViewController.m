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

#define kSegueIdentifierDecision @"decision"

@interface MainViewController () <DecisionViewControllerDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *backetImageView;

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
    [[TeamManager sharedInstance] getTeamsWithCompletion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initBracketImageView {
    UIImage *bracketImage = [UIImage imageNamed:@"bracket"];
    self.backetImageView = [[UIImageView alloc] initWithImage:bracketImage];
    [self.scrollView addSubview:self.backetImageView];
    self.scrollView.maximumZoomScale = 2;
    CGFloat minimumZoomScale = MIN(CGRectGetWidth(self.scrollView.frame)/bracketImage.size.width,CGRectGetHeight(self.scrollView.frame)/bracketImage.size.height);
    self.scrollView.minimumZoomScale = minimumZoomScale;
    self.scrollView.delegate = self;
    [self.scrollView setZoomScale:minimumZoomScale];


    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [view setBackgroundColor:[UIColor redColor]];

    [self.backetImageView addSubview:view];
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

#pragma mark - UISCrollViewDelegate
- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.backetImageView;
}

@end

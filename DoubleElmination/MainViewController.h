//
//  MainViewController.h
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *playButton;

- (IBAction)playButtonTapped:(id)sender;

@end

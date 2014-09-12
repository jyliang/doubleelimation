//
//  TeamBracketView.h
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import <UIKit/UIKit.h>
#import "Team.h"

#define kSizeBracket CGSizeMake(90,22)

@interface TeamBracketView : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *nameLabel;

- (void)loadTeam:(Team *)team;

@end

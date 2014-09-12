//
//  TeamImageView.m
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import "TeamImageView.h"
#import "TeamBracketView.h"
#import "GameManager.h"

@interface TeamImageView ()

@property (nonatomic, strong) NSMutableArray *teamViews;

@end

@implementation TeamImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)drawTeams {
    NSArray *subviews = self.subviews;
    for (UIView *view in subviews) {
        [view removeFromSuperview];
    }

    self.teamViews = [NSMutableArray array];
    CGFloat offset = 0;

    //draw all the teams
    TeamBracketView *teamView;
    for (int i = 0; i < 15*2; i ++) {
        teamView = [[TeamBracketView alloc] initWithFrame:CGRectMake(0, offset, kSizeBracket.width, kSizeBracket.height)];
        teamView.backgroundColor = [UIColor greenColor];
        [self addSubview:teamView];
        [self.teamViews addObject:teamView];
        offset += kSizeBracket.height;
    }
}

- (void)updateTeams {
    NSArray *games = [[GameManager sharedInstance] games];
    int index = 0;
    for (Game *game in games) {
        TeamBracketView *teamView1 = self.teamViews[index*2];
        TeamBracketView *teamView2 = self.teamViews[index*2+1];
        [teamView1 loadTeam:game.team1];
        [teamView2 loadTeam:game.team2];
        index++;
    }
}

@end

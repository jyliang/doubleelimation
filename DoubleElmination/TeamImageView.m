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
        CGPoint point = [self brackStartPointForIndex:i];
        teamView = [[TeamBracketView alloc] initWithFrame:CGRectMake(point.x, point.y, kSizeBracket.width, kSizeBracket.height)];
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

- (CGPoint)brackStartPointForIndex:(int)index {
    switch (index) {
        case 0: return CGPointMake(30, 50);
        case 1: return CGPointMake(30, 100);
        case 2: return CGPointMake(30, 150);
        case 3: return CGPointMake(30, 200);
        case 4: return CGPointMake(30, 250);
        case 5: return CGPointMake(30, 300);
        case 6: return CGPointMake(30, 350);
        case 7: return CGPointMake(30, 400);
        case 8: return CGPointMake(30, 450);

        case 9: return CGPointMake(100, 400);
        case 10: return CGPointMake(100, 450);
        case 11: return CGPointMake(100, 500);
        case 12: return CGPointMake(100, 550);

        case 13: return CGPointMake(200, 50);
        case 14: return CGPointMake(200, 100);
        case 15: return CGPointMake(200, 250);
        case 16: return CGPointMake(200, 300);

        case 17: return CGPointMake(300, 400);
        case 18: return CGPointMake(300, 450);
        case 19: return CGPointMake(300, 500);
        case 20: return CGPointMake(300, 550);

        case 21: return CGPointMake(300, 100);
        case 22: return CGPointMake(300, 250);

        case 23: return CGPointMake(300, 400);
        case 24: return CGPointMake(300, 500);

        case 25: return CGPointMake(400, 400);
        case 26: return CGPointMake(400, 500);

        case 27: return CGPointMake(500, 200);
        case 28: return CGPointMake(500, 400);

        case 29: return CGPointMake(600, 300);
        case 30: return CGPointMake(600, 500);
        default:
            break;
    }
    return CGPointZero;
}

@end

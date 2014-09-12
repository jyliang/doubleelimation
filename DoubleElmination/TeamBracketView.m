//
//  TeamBracketView.m
//  DoubleElmination
//
//  Created by Jason Liang on 9/12/14.
//
//

#import "TeamBracketView.h"
#import "UIImageView+AFNetworking.h"



@implementation TeamBracketView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetHeight(frame), CGRectGetHeight(frame))];
        [self addSubview:self.imageView];
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.imageView.frame), 0, CGRectGetWidth(frame)-CGRectGetWidth(self.imageView.frame), CGRectGetHeight(frame))];
        [self addSubview:self.nameLabel];
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

- (void)loadTeam:(Team *)team {
    if (team) {
        self.nameLabel.text = team.name;
        [self.imageView setImageWithURL:[NSURL URLWithString:team.imageUrlString]];
    } else {
        self.nameLabel.text = @"";
        [self.imageView setImage:nil];
    }

}

@end

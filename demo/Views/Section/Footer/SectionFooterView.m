//
//  PlaylistFooterView.m
//  anchor
//
//  Created by Ramy Kfoury on 6/19/13.
//  Copyright (c) 2013 Ramy Kfoury. All rights reserved.
//

#import "SectionFooterView.h"

#import "Constants.h"

@implementation SectionFooterView


- (void) dealloc
{
    self.view = nil; [_view release];
    self.titleLabel = nil; [_titleLabel release];
    self.iconImageView = nil; [_iconImageView release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self configure];
    }
    return self;
}

- (void) awakeFromNib
{
    [super awakeFromNib];
    [self configure];
}

- (void) configure
{
    [[NSBundle mainBundle] loadNibNamed:@"SectionFooterView" owner:self options:nil];
    [self addSubview:self.view];
    [self.titleLabel setFont:[UIFont fontWithName:FONT_NAME_REGULAR size:14.0]];
}

- (void) configureWithTitle:(NSString *)title
{
    [self configureWithTitle:title Icon:nil];
}

- (void) configureWithTitle:(NSString *)title Icon:(NSString *)icon
{
    [self.titleLabel setText:title];
    [self.iconImageView setImage:[UIImage imageNamed:icon]];
    
    CGRect frame = self.titleLabel.frame;
    frame.origin.x = icon ? 29.0 : 6.0;
    self.titleLabel.frame = frame;
}


@end

//
//  MenuCell.m
//  anchor
//
//  Created by Ramy Kfoury on 6/10/13.
//  Copyright (c) 2013 Ramy Kfoury. All rights reserved.
//

#import "MenuCell.h"
#import "Constants.h"

@implementation MenuCell

- (void) dealloc
{
    self.titleLabel = nil; [_titleLabel release];
    self.iconImageView = nil; [_iconImageView release];
    self.backgroundImageView = nil; [_backgroundImageView release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) configure
{
    [self.titleLabel setFont:[UIFont fontWithName:FONT_NAME_REGULAR size:20.0]];
    self.titleLabel.numberOfLines = 1;
    self.titleLabel.textColor = CustomColor;
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
}

- (void) configureWithTitle:(NSString *)title Icon:(NSString *)icon
{
    [self.titleLabel setText:[title uppercaseString]];
    [self.iconImageView setImage:[UIImage imageNamed:icon]];
    
    CGRect frame = self.titleLabel.frame;
    frame.origin.x = icon ? 40.0 : 7.0;
    self.titleLabel.frame = frame;
}

- (void) configureWithTitle:(NSString *)title Icon:(NSString *)icon Background:(NSString *)background
{
    [self.titleLabel setText:[title uppercaseString]];
    [self.iconImageView setImage:[UIImage imageNamed:icon]];
    [self.backgroundImageView setImage:[UIImage imageNamed:background]];
    
    CGRect frame = self.titleLabel.frame;
    frame.origin.x = icon ? 40.0 : 7.0;
    self.titleLabel.frame = frame;
}

@end

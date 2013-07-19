//
//  HeaderView.m
//  anchor
//
//  Created by Ramy Kfoury on 6/10/13.
//  Copyright (c) 2013 Ramy Kfoury. All rights reserved.
//

#import "HeaderView.h"
#import "Constants.h"

@implementation HeaderView

- (void) dealloc
{
    self.delegate = nil;
    self.view = nil; [_view release];
    self.rightButton = nil; [_rightButton release];
    self.leftButton = nil; [_leftButton release];
    self.titleButton = nil; [_titleButton release];
    self.settingsButton = nil; [_settingsButton release];
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
    [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    
    [self addSubview:self.view];
    [self.titleButton configure];
    [self.rightButton configure];
    [self.leftButton configure];
}

- (void) configureHeaderWithTitle:(NSString *)title
{
    [self.leftButton.titleLabel setTextColor:[UIColor blackColor]];
    [self.titleButton.titleLabel setFont:[UIFont fontWithName:FONT_NAME_REGULAR size:24.0]];
    [self.titleButton setTitle:[title uppercaseString] forState:UIControlStateNormal];
    if (title.length > 0)
    {
        [self.titleButton setImage:nil forState:UIControlStateNormal];
        [self.titleButton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
}

- (void) configureLeftButtonWithTitle:(NSString *)title Image:(NSString *)image BackgroundImage:(NSString *)backgroundImage
{
    self.leftButton.titleLabel.textColor = [UIColor blackColor];
    [self.leftButton setTitle:[title uppercaseString] forState:UIControlStateNormal];
    [self.leftButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [self.leftButton setBackgroundImage:[UIImage imageNamed:backgroundImage] forState:UIControlStateNormal];
}

- (void) leftButtonClicked:(id)sender
{    
    if (_delegate && [_delegate respondsToSelector:@selector(leftButtonClicked)])
    {
        [_delegate leftButtonClicked];
    }
}

- (void) settingsButtonClicked:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(settingsButtonClicked)])
    {
        [_delegate settingsButtonClicked];
    }
}

- (void) configureRightButtonWithTitle:(NSString *)title Image:(NSString *)image BackgroundImage:(NSString *)backgroundImage
{
    [self.rightButton setTitle:[title uppercaseString] forState:UIControlStateNormal];
    [self.rightButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [self.rightButton setBackgroundImage:[UIImage imageNamed:backgroundImage] forState:UIControlStateNormal];
}

- (void) rightButtonClicked:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(rightButtonClicked)])
    {
        [_delegate rightButtonClicked];
    }
}

@end

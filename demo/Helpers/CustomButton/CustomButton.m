//
//  CustomButton.m
//  demo
//
//  Created by Ramy Kfoury on 6/18/13.
//  Copyright (c) 2013 Ramy Kfoury. All rights reserved.
//

#import "CustomButton.h"

#import "Constants.h"

#define BUTTON_FONT_SIZE 16.0

@implementation CustomButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        [self configure];
    }
    return self;
}

- (void) configure
{    
    [self.titleLabel setFont:[UIFont fontWithName:FONT_NAME_REGULAR size:BUTTON_FONT_SIZE]];
    [self.titleLabel setNumberOfLines:1];
    [self.titleLabel setTextAlignment:UITextAlignmentCenter];
    [self.titleLabel setAdjustsFontSizeToFitWidth:YES];
    [self.titleLabel setLineBreakMode:UILineBreakModeClip];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self setTitleEdgeInsets:UIEdgeInsetsMake(4, 3, 0, 3)];
}

- (void) configureWithTag:(int)tag
{
    [self configure];
    self.tag = tag;
}

@end

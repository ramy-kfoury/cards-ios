//
//  RKTextField.m
//  inmynewworld
//
//  Created by MacMini on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RKTextField.h"

@implementation RKTextField

@synthesize textInset;
@synthesize clearInset;
@synthesize indent;

- (CGRect)textRectForBounds:(CGRect)bounds
{
    CGFloat inset = indent ? textInset : 0.0;
    clearInset = 0.0;
    CGRect rect = CGRectMake(bounds.origin.x + inset, bounds.origin.y + 1.0, bounds.size.width - 2*inset - clearInset, bounds.size.height);
    return rect;
}

- (CGRect)editingRectForBounds:(CGRect)bounds 
{
    CGFloat inset = indent ? textInset : 0.0;
    clearInset = self.clearButtonMode == UITextFieldViewModeWhileEditing ? 20.0 : 0.0;
    CGRect rect = CGRectMake(bounds.origin.x + inset, bounds.origin.y + 1.0, bounds.size.width - 2*inset - clearInset, bounds.size.height);
    return rect;
}

- (CGRect)clearButtonRectForBounds:(CGRect)bounds 
{
    CGRect frame = [super clearButtonRectForBounds:bounds];
    return CGRectMake(frame.origin.x, frame.origin.y + 1.0, frame.size.width , frame.size.height);
}

@end

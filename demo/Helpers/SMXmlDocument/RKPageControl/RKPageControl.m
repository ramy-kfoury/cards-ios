//
//  RKPageControl.m
//  idbox
//
//  Created by MacMini on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RKPageControl.h"

@implementation RKPageControl

@synthesize imageNormal;
@synthesize imageCurrent;

- (void) dealloc
{
    [imageNormal release], imageNormal = nil;
    [imageCurrent release], imageCurrent = nil;
    
	[super dealloc];
}

/** override to update dots */
- (void) setCurrentPage:(NSInteger)currentPage
{
    [super setCurrentPage:currentPage];
    
    // update dot views
    [self updateDots];
}

/** override to update dots */
- (void) updateCurrentPageDisplay
{
    [super updateCurrentPageDisplay];
    
    // update dot views
    [self updateDots];
}

/** Override setImageNormal */
- (void) setImageNormal:(UIImage*)image
{
    [imageNormal release];
    imageNormal = [image retain];
    
    // update dot views
    [self updateDots];
}

/** Override setImageCurrent */
- (void) setImageCurrent:(UIImage*)image
{
    [imageCurrent release];
    imageCurrent = [image retain];
    
    // update dot views
    [self updateDots];
}

/** Override to fix when dots are directly clicked */
- (void) endTrackingWithTouch:(UITouch*)touch withEvent:(UIEvent*)event 
{
    [super endTrackingWithTouch:touch withEvent:event];
    
    [self updateDots];
}

#pragma mark - (Private)

- (void) updateDots
{
    if(imageCurrent || imageNormal)
    {
        // Get subviews
        NSArray* dotViews = self.subviews;
        for(int i = 0; i < dotViews.count; ++i)
        {
            UIImageView* dot = [dotViews objectAtIndex:i];
            // Set image
            if(UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone){
               dot.frame = CGRectMake(dot.frame.origin.x, dot.frame.origin.y, 19, 19); 
            }
            
            dot.image = (i == self.currentPage) ? imageCurrent : imageNormal;
        }
    }
}

@end

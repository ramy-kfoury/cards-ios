//
//  RKPageControl.h
//  idbox
//
//  Created by MacMini on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RKPageControl : UIPageControl
{
    UIImage* imageNormal;
    UIImage* imageCurrent;
}

@property (nonatomic, readwrite, retain) UIImage* imageNormal;
@property (nonatomic, readwrite, retain) UIImage* imageCurrent;

- (void) updateDots;

@end

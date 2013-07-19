//
//  PlaylistSection.h
//  anchor
//
//  Created by Ramy Kfoury on 6/19/13.
//  Copyright (c) 2013 Ramy Kfoury. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SECTION_HEADER_HEIGHT 30.0

@interface SectionHeaderView : UIView

@property (nonatomic, strong) IBOutlet UIView *view;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UIImageView *iconImageView;
- (void) configureWithTitle:(NSString *)title;
- (void) configureWithTitle:(NSString *)title Icon:(NSString *)icon;
@end


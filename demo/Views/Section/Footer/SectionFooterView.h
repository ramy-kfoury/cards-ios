//
//  PlaylistFooterView.h
//  anchor
//
//  Created by Ramy Kfoury on 6/19/13.
//  Copyright (c) 2013 Ramy Kfoury. All rights reserved.
//

#import <UIKit/UIKit.h>


#define SECTION_FOOTER_HEIGHT 28.0
#define MENU_SECTION_FOOTER_HEIGHT 44.0

@interface SectionFooterView : UIView

@property (nonatomic, strong) IBOutlet UIView *view;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UIImageView *iconImageView;
- (void) configureWithTitle:(NSString *)title;
- (void) configureWithTitle:(NSString *)title Icon:(NSString *)icon;
@end

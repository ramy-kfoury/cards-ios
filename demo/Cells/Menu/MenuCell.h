//
//  MenuCell.h
//  anchor
//
//  Created by Ramy Kfoury on 6/10/13.
//  Copyright (c) 2013 Ramy Kfoury. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuCell : UITableViewCell

#define MENU_CELL_HEIGHT 44.0

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UIImageView *iconImageView;
@property (nonatomic, strong) IBOutlet UIImageView *backgroundImageView;

- (void) configure;
- (void) configureWithTitle:(NSString *)title Icon:(NSString *)icon;
- (void) configureWithTitle:(NSString *)title Icon:(NSString *)icon Background:(NSString *)background;
@end

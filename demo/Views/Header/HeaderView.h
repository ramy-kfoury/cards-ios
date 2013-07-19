//
//  HeaderView.h
//  anchor
//
//  Created by Ramy Kfoury on 6/10/13.
//  Copyright (c) 2013 Ramy Kfoury. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomButton;

@protocol HeaderViewDelegate <NSObject>
@optional
- (void) leftButtonClicked;
- (void) rightButtonClicked;
- (void) settingsButtonClicked;

@end

@interface HeaderView : UIView

@property (nonatomic, strong) IBOutlet UIView *view;
@property (nonatomic, strong) IBOutlet CustomButton *leftButton;
@property (nonatomic, strong) IBOutlet CustomButton *rightButton;
@property (nonatomic, strong) IBOutlet CustomButton *titleButton;
@property (nonatomic, strong) IBOutlet CustomButton *settingsButton;

@property (nonatomic, assign) id <HeaderViewDelegate> delegate;

- (IBAction)leftButtonClicked:(id)sender;
- (IBAction)rightButtonClicked:(id)sender;
- (IBAction)settingsButtonClicked:(id)sender;

- (void) configureHeaderWithTitle:(NSString *)title;
- (void) configureLeftButtonWithTitle:(NSString *)title Image:(NSString *)image BackgroundImage:(NSString *)backgroundImage;
- (void) configureRightButtonWithTitle:(NSString *)title Image:(NSString *)image BackgroundImage:(NSString *)backgroundImage;

@end

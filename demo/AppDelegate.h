//
//  AppDelegate.h
//  demo
//
//  Created by Ramy Kfoury on 7/1/13.
//  Copyright (c) 2013 Ramy Kfoury. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) MainViewController *mainVC;
@property (strong, nonatomic) UIAlertView *alertView;

- (void) displayAlertView:(NSString *)message WithTitle:(NSString *)title AndCancelTitle:(NSString *)cancelTitle OtherButtonTitle:(NSString *)otherTitle fromDelegate:(id)delegate;
- (void) dismissAlertView;
@end

//
//  MainViewController.h
//  anchor
//
//  Created by Ramy Kfoury on 6/10/13.
//  Copyright (c) 2013 Ramy Kfoury. All rights reserved.
//

#import "PortraitViewController.h"

@interface MainViewController : PortraitViewController

@property (nonatomic, strong) IBOutlet HeaderView * headerView;
@property (nonatomic, strong) IBOutlet UIView * centerView;
@property (nonatomic, strong) IBOutlet MainView * mainView;
@property (nonatomic, strong) IBOutlet LeftView * leftView;

@end

//
//  MainView.h
//  anchor
//
//  Created by Ramy Kfoury on 6/10/13.
//  Copyright (c) 2013 Ramy Kfoury. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum _MainViewState
{
    MainViewEditingState,
    MainViewDefaultState
} MainViewState;

@protocol MainViewDelegate <NSObject>
@optional
- (void) mainDidSelectItem;
- (void) mainDidTriggerRefresh;
- (void) mainDidSendItem:(NSDictionary *)dict;
@end

@interface MainView : UIView

@property (nonatomic, strong) IBOutlet UIView *view;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UILabel *responseLabel;
@property (nonatomic, strong) IBOutlet UILabel *notificationLabel;
@property (nonatomic, strong) IBOutlet UIButton *queueButton;
@property (nonatomic, strong) IBOutlet UITextField *nameTextField;
@property (nonatomic, strong) IBOutlet UITextField *emailTextField;
@property (nonatomic, strong) IBOutlet UITextField *homepageTextField;
@property (nonatomic, assign) id delegate;

- (void) configureQueueLabel;
- (IBAction) sendButtonClicked:(id)sender;
- (IBAction) queueButtonClicked:(id)sender;
- (void) configureTableForMode:(MainViewState)state withState:(BOOL)stateBoolean;
@end

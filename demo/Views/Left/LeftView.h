//
//  LeftView.h
//  anchor
//
//  Created by Ramy Kfoury on 6/10/13.
//  Copyright (c) 2013 Ramy Kfoury. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LeftViewDelegate <NSObject>
@optional
- (void) leftViewDidSelectAction:(NSString *)action;
- (void) leftViewDidSelectItem:(NSInteger)index;
@end

@interface LeftView : UIView

@property (nonatomic, strong) IBOutlet UIView *view;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, assign) id <LeftViewDelegate> delegate;

- (void) configureWithItems:(NSArray *)menuItems;
- (void) configureCategories;
@end

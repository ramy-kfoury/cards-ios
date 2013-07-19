//
//  LeftView.m
//  anchor
//
//  Created by Ramy Kfoury on 6/10/13.
//  Copyright (c) 2013 Ramy Kfoury. All rights reserved.
//

#import "LeftView.h"
#import "Constants.h"

@interface LeftView ()
@property (nonatomic, strong) NSArray *menuItems;
@end

@implementation LeftView

- (void) dealloc
{
    self.delegate = nil;
    self.menuItems = nil; [_menuItems release];
    self.view = nil; [_view release];
    self.tableView = nil; [_tableView release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self configure];
    }
    return self;
}

- (void) awakeFromNib
{
    [super awakeFromNib];
    [self configure];
}

- (void) configure
{    
    [[NSBundle mainBundle] loadNibNamed:@"LeftView" owner:self options:nil];
    [self addSubview:self.view];
    self.menuItems = [[NSArray alloc] init];
}

- (void) configureWithItems:(NSArray *)menuItems
{
    self.menuItems = menuItems;
    [self.tableView reloadData];
}

- (void) configureCategories
{
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"MenuCell";
    MenuCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil];
        
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[MenuCell class]])
            {
                cell = (MenuCell *)currentObject;
                [cell configure];
                break;
            }
        }
    }
    
    
    NSDictionary *menuDict = [self.menuItems objectAtIndex:indexPath.row];
    NSString *title = [NSLocalizedString([menuDict valueForKey:@"title"], nil) uppercaseString];
    NSString *icon = [menuDict valueForKey:@"icon"];
    [cell configureWithTitle:title Icon:icon Background:[menuDict valueForKey:@"background"]];
    
    return cell;
}

#pragma mark - TableView methods

#pragma mark - TableView methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {        
        default:
            return MENU_CELL_HEIGHT;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 1:
        {
            return SECTION_HEADER_HEIGHT;
        }
        default:
            return 0.0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    switch (section)
    {
        default:
            return SECTION_FOOTER_HEIGHT;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            SectionFooterView *sectionView = [[SectionFooterView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, SECTION_FOOTER_HEIGHT)];
            [sectionView configureWithTitle:[NSLocalizedString(@"footer-title", nil) uppercaseString] Icon:@"footer-icon"];
            return sectionView;
        }
        default:
            return nil;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            SectionHeaderView *sectionView = [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, SECTION_HEADER_HEIGHT)];
            [sectionView configureWithTitle:[NSLocalizedString(@"header-title", nil) uppercaseString] Icon:@"header-icon"];
            return sectionView;
        }
        default:
            return nil;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            return self.menuItems.count;
            break;
        }
        default:
            return 0;
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
        {
            NSDictionary *menuDict = [self.menuItems objectAtIndex:indexPath.row];
            NSString *action = [menuDict valueForKey:@"action"];
            if (_delegate && [_delegate respondsToSelector:@selector(leftViewDidSelectAction:)])
            {
                [_delegate leftViewDidSelectAction:action];
            }
            break;
        }
        default:
            break;
    }
}

@end

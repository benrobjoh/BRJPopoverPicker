//
//  BRJTableViewController.m
//  BRJPopoverPicker Example
//
//  Created by Ben Johnson on 3/30/14.
//  Copyright (c) 2014 Bixelcog. All rights reserved.
//

#import "BRJTableViewController.h"
#import "BRJTableViewCell.h"

@interface BRJTableViewController () <BRJPopoverPickerDataSource, BRJPopoverPickerDelegate>
@property (strong, nonatomic) NSArray *teamNames;
@property (strong, nonatomic) BRJPopoverPicker *popoverPicker;
@property (assign, nonatomic) NSInteger selectedTeam;
@end

@implementation BRJTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        NSURL *teamPlistURL = [[NSBundle mainBundle] URLForResource:@"MLB Teams" withExtension:@"plist"];
        _teamNames = [NSArray arrayWithContentsOfURL:teamPlistURL];
        
        _popoverPicker = ({
            BRJPopoverPicker *popoverPicker = [[BRJPopoverPicker alloc] init];
            popoverPicker.delegate = self;
            popoverPicker.dataSource = self;
            popoverPicker.title = NSLocalizedString(@"popover.title", @"Baseball");
            popoverPicker;
        });
        
        _selectedTeam = -1;
        
        self.title = NSLocalizedString(@"main.title", @"Favorite Team");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[BRJTableViewCell class] forCellReuseIdentifier:BRJTableViewCellReuseIdentifier];
}

#pragma mark - Configuration
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = NSLocalizedString(@"main.question", @"What is your favorite baseball team?");
}

#pragma mark - Protocol: UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BRJTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BRJTableViewCellReuseIdentifier forIndexPath:indexPath];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

#pragma mark - Protocol: UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CGRect frame = [tableView rectForRowAtIndexPath:indexPath];
    if (!CGRectEqualToRect(frame, CGRectZero)) {
        if (self.selectedTeam >= 0) {
            [self.popoverPicker selectRowAtIndex:self.selectedTeam];
        }
        [self.popoverPicker presentPopoverPickerFromRect:frame inView:tableView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}

#pragma mark - Protocol: BRJPopoverPickerDataSource
- (NSString *)popoverPicker:(BRJPopoverPicker *)popoverPicker titleForRowAtIndex:(NSUInteger)index {
    return self.teamNames[index];
}

- (NSUInteger)numberOfRowsInPopoverPicker:(BRJPopoverPicker *)popoverPicker {
    return [self.teamNames count];
}

#pragma mark - Protocol: BRJPopoverPickerDelegate
- (void)popoverPicker:(BRJPopoverPicker *)popoverPicker didSelectRowWithTitle:(NSString *)selectedTitle atIndex:(NSUInteger)selectedIndex {
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    self.selectedTeam = selectedIndex;
    cell.detailTextLabel.text = selectedTitle;
}
@end

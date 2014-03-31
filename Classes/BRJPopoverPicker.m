//
//  BRJPopoverPicker.m
//  
//
//  Created by Ben Johnson on 3/30/14.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "BRJPopoverPicker.h"

static NSString * const BRJPopoverPickerCellReuseIdentifier = @"BRJPopoverPickerCellReuseIdentifier";

@interface BRJPopoverPicker () <UITableViewDataSource, UITableViewDelegate, UIPopoverControllerDelegate>
@property (strong, nonatomic) UIPopoverController *popoverController;
@end

@implementation BRJPopoverPicker
- (instancetype)init {
    self = [super init];
    if (self) {

    }
    return self;
}

#pragma mark - Configuration
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSString *title = [self.dataSource popoverPicker:self titleForRowAtIndexPath:indexPath];
    cell.textLabel.text = title;
}

- (void)configurePopoverController {
    self.popoverController = ({
        UITableViewController *tableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
        tableViewController.tableView.dataSource = self;
        tableViewController.tableView.delegate = self;
        [tableViewController.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:BRJPopoverPickerCellReuseIdentifier];
        tableViewController.title = self.title;
        
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tableViewController];
        
        UIPopoverController *popoverController = [[UIPopoverController alloc] initWithContentViewController:navigationController];
        popoverController;
    });
}

#pragma mark - Presentation and Dismissal
- (void)presentPopoverPickerFromRect:(CGRect)rect inView:(UIView *)view permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated {
    [self configurePopoverController];
    [self.popoverController presentPopoverFromRect:rect inView:view permittedArrowDirections:arrowDirections animated:animated];
}

- (void)presentPopoverPickerFromBarButtonItem:(UIBarButtonItem *)item permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated {
    [self configurePopoverController];
    [self.popoverController presentPopoverFromBarButtonItem:item permittedArrowDirections:arrowDirections animated:animated];
}

- (void)dismissPopoverPickerAnimated:(BOOL)animated {
    [self.popoverController dismissPopoverAnimated:animated];
    self.popoverController = nil;
}

#pragma mark - Protocol: UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource numberOfRowsInPopoverPicker:self];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BRJPopoverPickerCellReuseIdentifier forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

#pragma mark - Protocol: UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(popoverPicker:didSelectRowWithTitle:atIndexPath:)]) {
        NSString *title = [self.dataSource popoverPicker:self titleForRowAtIndexPath:indexPath];
        [self.delegate popoverPicker:self didSelectRowWithTitle:title atIndexPath:indexPath];
    }
    
    [self dismissPopoverPickerAnimated:YES];
}

#pragma mark - Protocol: UIPopoverControllerDelegate
- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
    self.popoverController = nil;
}
@end

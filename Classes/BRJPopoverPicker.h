//
//  BRJPopoverPicker.h
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

#import <Foundation/Foundation.h>
#import "BRJPopoverPickerDelegate.h"
#import "BRJPopoverPickerDataSource.h"

/**
 A `BRJPopoverPicker` instance displays a popover with a list of items. The picker supports selecting one item from the list. Upon selection, the picker will hide itself.
 
 The picker must have a delegate object that implements `BRJPopoverPickerDelegate` and a data source object that implements `BRJPopoverPickerDataSource`.
 
 This class is iPad-only. Using `BRJPopoverPicker` on an iPhone will result in an exception.
 */

@interface BRJPopoverPicker : NSObject
/**
 The object that acts as the delegate for the popover picker
 */
@property (weak, nonatomic) id<BRJPopoverPickerDelegate> delegate;

/**
 The object that acts as the data source for the popover picker
 */
@property (weak, nonatomic) id<BRJPopoverPickerDataSource> dataSource;

/**
 A localized string used as a title for the popover picker. The navigation bar will display this title.
 */
@property (copy, nonatomic) NSString *title;

/**
 The background color for the picker's selected cell
 */
@property (strong, nonatomic) UIColor *selectedBackgroundColor;

/**
 Returns the title for row at the specified index in the picker
 @param index Zero-indexed row number
 @return The string used as the title for the row
 */
- (NSString *)titleForRowAtIndex:(NSUInteger)index;

/**
 Returns the number of rows in the picker
 @return The number of rows in the picker
 */
- (NSUInteger)numberOfRows;

/**
 Selects and highlights the specified row. Calling this method does not cause a call to the delegate method `popoverPicker:didSelectRowWithTitle:atIndex:`. The picker will scroll the row at `index` to the top.
 @param index The index of the row to select and highlight
 */
- (void)selectRowAtIndex:(NSUInteger)index;

/**
 Returns the index of the picker's selected row
 @return The index of the selected row, or `NSNotFound` if the picker does not have a selected row
 */
- (NSInteger)indexOfSelectedRow;

/**
 @name Presentation
 */

/**
 Presents the popover picker from the specified location
 @param rect The rectangle from which to present the popover picker
 @param view The view which contains `rect`
 @param arrowDirections The allowed arrow directions of the popover
 @param animated Pass `YES` to animate the popover's presentation
 */
- (void)presentPopoverPickerFromRect:(CGRect)rect inView:(UIView *)view permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated;

/**
 Presents the popover picker from the specified location
 @param item The bar button item from which to present the popover picker
 @param arrowDirections The allowed arrow directions of the popover
 @param animated Pass `YES` to animate the popover's presentation
 */
- (void)presentPopoverPickerFromBarButtonItem:(UIBarButtonItem *)item permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated;

/**
 @name Dismissal
 */

/**
 Dismisses the popover picker
 @param animated Animates the dismissal if YES
 */
- (void)dismissPopoverPickerAnimated:(BOOL)animated;

@end

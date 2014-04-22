//
//  BRJPopoverPickerDelegate.h
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
@class BRJPopoverPicker;

/**
 The delegate of the `BRJPopoverPicker` conforms to the `BRJPopoverPickerDelegate` protocol. The delegate reacts to row selections and gives the picker information about its size.
 */
@protocol BRJPopoverPickerDelegate <NSObject>
@optional
/**
 Informs the delegate that a particular row is selected
 
 @param popoverPicker The picker where the selection occurred
 @param selectedTitle The title for the selected row
 @param selectedIndex The index of the selected row
 */
- (void)popoverPicker:(BRJPopoverPicker *)popoverPicker didSelectRowWithTitle:(NSString *)selectedTitle atIndex:(NSUInteger)selectedIndex;

/**
 Queries the delegate to see if the user is allowed to select a row. The popover picker does not call this method in response to programmatic calls to select a row.
 
 @param popoverPicker The picker that wants to select a particular row
 @param title The title for the row that may become selected
 @param index The index of the row that may become selected
 @return YES if the user is allowed to select the row at `index`
 */
- (BOOL)popoverPicker:(BRJPopoverPicker *)popoverPicker canSelectRowWithTitle:(NSString *)title atIndex:(NSUInteger)index;

/**
 Returns the desired size for the popover picker
 
 @param popoverPicker The picker whose size is being requested
 @return The content size for `popoverPicker`
 */
- (CGSize)contentSizeForPopoverPicker:(BRJPopoverPicker *)popoverPicker;
@end

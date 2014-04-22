//
//  BRJPopoverPickerDataSource.h
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
 Objects that wish to provide data to an instance of `BRJPopoverPicker` adopt the `BRJPopoverPickerDataSource` protocol. The data source provides the picker with the number of rows and the title for each row in the picker.
 */
@protocol BRJPopoverPickerDataSource <NSObject>
@required
/**
 Asks the data source to return the title for a row in the picker
 
 @param popoverPicker The popover requesting the title
 @param index The location in the picker for the requested title
 @return The title for the row at the specified index
 */
- (NSString *)popoverPicker:(BRJPopoverPicker *)popoverPicker titleForRowAtIndex:(NSUInteger)index;

/**
 Asks the data source for the number of rows to display in the picker
 
 @param popoverPicker The popover requesting to know how many rows to display
 @return The number of rows
 */
- (NSUInteger)numberOfRowsInPopoverPicker:(BRJPopoverPicker *)popoverPicker;

@end

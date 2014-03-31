//
//  BRJPopoverPickerDelegate.h
//  
//
//  Created by Ben Johnson on 3/30/14.
//
//

#import <Foundation/Foundation.h>
@class BRJPopoverPicker;

@protocol BRJPopoverPickerDelegate <NSObject>
@optional
- (void)popoverPicker:(BRJPopoverPicker *)popoverPicker didSelectRowWithTitle:(NSString *)selectedTitle atIndexPath:(NSIndexPath *)selectedIndexPath;
@end

//
//  BRJTableViewCell.m
//  BRJPopoverPicker Example
//
//  Created by Ben Johnson on 3/30/14.
//  Copyright (c) 2014 Bixelcog. All rights reserved.
//

#import "BRJTableViewCell.h"

NSString * const BRJTableViewCellReuseIdentifier = @"BRJTableViewCellReuseIdentifier";

@implementation BRJTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

@end

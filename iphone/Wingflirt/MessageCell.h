//
//  MessageCell.h
//  Wingflirt
//
//  Created by Richard McClellan on 3/20/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"

@interface MessageCell : UITableViewCell

- (void) configureWithMessage:(Message *)message;
+ (CGFloat)heightForMessage:(Message *)message;

@end
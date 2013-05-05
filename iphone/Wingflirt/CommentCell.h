//
//  CommentCell.h
//  Wingflirt
//
//  Created by Richard McClellan on 3/26/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"

@interface CommentCell : UITableViewCell

- (void) configureWithComment:(Comment *)comment;
+ (CGFloat)heightForComment:(Comment *)comment;

@end

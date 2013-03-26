//
//  MessageCell.m
//  Wingflirt
//
//  Created by Richard McClellan on 3/20/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if((self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier])) {

    }
    return self;
}

- (void) configureWithMessage:(Message *)message {
    self.textLabel.text = message.text;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end

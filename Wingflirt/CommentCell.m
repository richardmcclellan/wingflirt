
//
//  CommentCell.m
//  Wingflirt
//
//  Created by Richard McClellan on 3/26/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import "CommentCell.h"

@implementation CommentCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.textLabel.numberOfLines = 0;
        self.textLabel.font = [WFStyle largeFont];
    }
    return self;
}

- (void) configureWithComment:(Comment *)comment {
//    self.textLabel.text = comment.text;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    NSLog(@"layoutSubviews textLabel frame %@", [self.textLabel frameDescription]);
}

+ (CGFloat)heightForComment:(Comment *)comment {
//    CGSize size = [comment.text sizeWithFont:[WFStyle largeFont] constrainedToSize:CGSizeMake(320, 10000)];
//    return size.height + 20.0;
    return 50;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

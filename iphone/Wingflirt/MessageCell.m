//
//  MessageCell.m
//  Wingflirt
//
//  Created by Richard McClellan on 3/20/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void) configureWithMessage:(Message *)message {
    self.textLabel.text = message.text;
    self.textLabel.numberOfLines = 0;
    self.textLabel.font = [WFStyle largeFont];
    self.textLabel.backgroundColor = [UIColor clearColor];
}

- (void) drawRect:(CGRect)rect {
    // GET CONTEXT
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // BACKGROUND COLOR
    [[WFStyle lighterGrayColor] set];
    CGContextFillRect(context, rect);
    
    // INSET ROUNDED RECTANGLE
    if(!self.highlighted && !self.selected) {
        [[WFStyle lightestGrayColor] set];
    } else {
        [[WFStyle lightGrayColor] set];
    }
//    CGRect insetRect = CGRectInset(rect, 10, 10);
        CGContextSetShadowWithColor(context, CGSizeMake(0,0.5), 2, [[WFStyle darkGrayColor] CGColor]);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, 10, 10) cornerRadius:5];
    [path fill];
}

- (void) layoutSubviews {
    [super layoutSubviews];
    [self.textLabel setFrame:CGRectInset(self.textLabel.frame, 5, 0)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    [self setNeedsDisplay];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    [self setNeedsDisplay];
}

+ (CGFloat)heightForMessage:(Message *)message {
    CGSize size = [message.text sizeWithFont:[WFStyle largeFont] constrainedToSize:CGSizeMake(290, 10000)];
    return size.height + 30.0;
}

@end

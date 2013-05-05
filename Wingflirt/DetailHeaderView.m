//
//  DetailHeaderView.m
//  Wingflirt
//
//  Created by Richard McClellan on 3/30/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import "DetailHeaderView.h"

@implementation DetailHeaderView

- (id)initWithFrame:(CGRect)frame {
    if((self = [super initWithFrame:frame])) {
        headerLabel = [[UILabel alloc] initWithFrame:CGRectInset(CGRectMake(0, 0, 320, 1000), 10, 10)];
        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.numberOfLines = 0;
        headerLabel.font = [WFStyle largeFont];
        self.backgroundColor = [WFStyle bgColor];
        [self addSubview:headerLabel];
    }
    return self;
}

- (void) configureWithMessage:(Message *)message {
    headerLabel.text = message.text;
    [headerLabel sizeToFit];
    [self sizeToFit];
}

-(CGSize) sizeThatFits:(CGSize)size {
    return CGSizeMake(size.width, headerLabel.bottom + 10);
}

@end

//
//  UIFont-Additions.m
//  Forecast
//
//  Created by Richard McClellan on 1/12/12.
//  Copyright (c) 2012 Forecast. All rights reserved.
//

#import "UIFont-Additions.h"

@implementation UIFont (UIFont_Additions)

-(CGFloat)lineHeight {
    return (self.ascender - self.descender) + 1;
}

@end

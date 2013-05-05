//
//  UINavigationBar-Additions.m
//  Forecast
//
//  Created by Richard McClellan on 4/26/11.
//  Copyright 2011 Hurricane Party. All rights reserved.
//

#import "UINavigationBar-Additions.h"

@implementation UINavigationBar (UINavigationBar_Additions)

- (void) drawRect:(CGRect)rect {
    [[WFStyle navigationBarBackgroundImage] drawInRect:CGRectMake(0, 0, self.width, 44)];
}


@end

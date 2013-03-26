//
//  UIBarButtonItem+Blocks.h
//  Wingflirt
//
//  Created by Richard McClellan on 3/24/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Blocks)

- (id)initWithBarButtonSystemItem:(UIBarButtonSystemItem)item block:(void (^)(id))block;
- (id) initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style block:(void (^)(id))block;
- (id) initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style block:(void (^)(id))block;
@end

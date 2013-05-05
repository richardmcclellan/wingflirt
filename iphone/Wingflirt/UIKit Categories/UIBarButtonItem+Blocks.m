//
//  UIBarButtonItem+Blocks.m
//  Wingflirt
//
//  Created by Richard McClellan on 3/24/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import "UIBarButtonItem+Blocks.h"
#import <objc/runtime.h>

@implementation UIBarButtonItem (Blocks)

- (id)initWithBarButtonSystemItem:(UIBarButtonSystemItem)item block:(void (^)(id))block {
    if ((self = [self initWithBarButtonSystemItem:item target:nil action:@selector(callbackBlockWithSender:)])){
        [self setBlock:block];
    }
    return self;
}

- (id) initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style block:(void (^)(id))block {
    if ((self = [self initWithTitle:title style:style target:nil action:@selector(callbackBlockWithSender:)])){
        [self setBlock:block];
    }
    return self;
}

- (id) initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style block:(void (^)(id))block {
    if ((self = [self initWithImage:image style:style target:nil action:@selector(callbackBlockWithSender:)])){
        [self setBlock:block];
    }
    return self;
}

- (id) initWithImage:(UIImage *)image landscapeImagePhone:(UIImage *)landscapeImagePhone style:(UIBarButtonItemStyle)style block:(void (^)(id))block {
    if((self = [self initWithImage:image landscapeImagePhone:landscapeImagePhone style:style target:nil action:@selector(callbackBlockWithSender:)])) {
        [self setBlock:block];
    }
    return self;
}

- (void) setBlock:(void (^)(id))block {
    objc_setAssociatedObject(self, "actionBlock", block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.target = objc_getAssociatedObject(self, "actionBlock");
}

@end

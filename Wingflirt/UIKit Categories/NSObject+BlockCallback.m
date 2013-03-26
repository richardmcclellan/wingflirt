//
//  NSObject+BlockCallback.m
//  Wingflirt
//
//  Created by Richard McClellan on 3/24/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import "NSObject+BlockCallback.h"

@implementation NSObject (BlockCallback)

- (void)callbackBlock {
    ((void (^)())self)();
}

- (void)callbackBlockWithSender:(id)sender {
    ((void (^)(id))self)(sender);
}

@end

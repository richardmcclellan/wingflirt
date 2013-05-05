//
//  PFObject+DefaultClassName.m
//  Wingflirt
//
//  Created by Richard McClellan on 3/24/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import "PFObject+DefaultClassName.h"

@implementation PFObject (DefaultClassName)

+ (NSString *)parseClassName {
    return NSStringFromClass([self class]);
}

@end

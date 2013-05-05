//
//  PFObject+DefaultClassName.h
//  Wingflirt
//
//  Created by Richard McClellan on 3/24/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import <Parse/Parse.h>

@interface PFObject (DefaultClassName)

+ (NSString *)parseClassName;

@end

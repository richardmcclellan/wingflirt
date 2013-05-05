//
//  Comment.h
//  Wingflirt
//
//  Created by Richard McClellan on 3/24/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import <Parse/Parse.h>
#import "Message.h"

@interface Comment : PFObject <PFSubclassing>

@property (nonatomic, strong) Message *message;
@property (nonatomic, copy) NSString *text;

@end

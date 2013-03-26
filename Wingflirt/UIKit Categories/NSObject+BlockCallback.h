//
//  NSObject+BlockCallback.h
//  Wingflirt
//
//  Created by Richard McClellan on 3/24/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BlockCallback)

- (void)callbackBlock;
- (void)callbackBlockWithSender:(id)sender;

@end

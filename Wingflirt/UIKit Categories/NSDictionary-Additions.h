//
//  NSDictionary-Additions.h
//  Forecast
//
//  Created by Richard McClellan on 5/17/11.
//  Copyright 2011 Hurricane Party. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (NSDictionary_Additions)

- (BOOL) boolForKey:(id)key;
- (float) floatForKey:(id)key;
- (NSInteger) integerForKey:(id)key;
- (double) doubleForKey:(id)key;

@end

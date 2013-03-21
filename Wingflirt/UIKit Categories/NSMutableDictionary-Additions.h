//
//  NSMutableDictionary-Additions.h
//  Forecast
//
//  Created by Richard McClellan on 5/17/11.
//  Copyright 2011 Hurricane Party. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableDictionary (NSMutableDictionary_Additions)

- (void) setBool:(BOOL)value forKey:(id)key;
- (void) setFloat:(float)value forKey:(id)key;
- (void) setInteger:(NSInteger)value forKey:(id)key;
- (void) setDouble:(double)value forKey:(id)key;

@end

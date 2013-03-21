//
//  NSMutableDictionary-Additions.m
//  Forecast
//
//  Created by Richard McClellan on 5/17/11.
//  Copyright 2011 Hurricane Party. All rights reserved.
//

#import "NSMutableDictionary-Additions.h"


@implementation NSMutableDictionary (NSMutableDictionary_Additions)

- (void) setBool:(BOOL)value forKey:(id)key {
    [self setObject:[NSNumber numberWithBool:value] forKey:key];
}

- (void) setFloat:(float)value forKey:(id)key {
    [self setObject:[NSNumber numberWithFloat:value] forKey:key];
}

- (void) setInteger:(NSInteger)value forKey:(id)key {
    [self setObject:[NSNumber numberWithInteger:value] forKey:key];
}

- (void) setDouble:(double)value forKey:(id)key {
    [self setObject:[NSNumber numberWithDouble:value] forKey:key];
}

@end

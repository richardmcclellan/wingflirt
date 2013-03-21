//
//  NSDictionary-Additions.m
//  Forecast
//
//  Created by Richard McClellan on 5/17/11.
//  Copyright 2011 Hurricane Party. All rights reserved.
//

#import "NSDictionary-Additions.h"

@implementation NSDictionary (NSDictionary_Additions)

- (BOOL) boolForKey:(id)key {
    id obj = [self objectForKey:key];
    return obj ? [obj boolValue] : NO;
}

- (float) floatForKey:(id)key {
    id obj = [self objectForKey:key];
    return obj ? [obj floatValue] : 0;
}

- (NSInteger) integerForKey:(id)key {
    id obj = [self objectForKey:key];
    return obj ? [obj integerValue] : 0;
}

- (double) doubleForKey:(id)key {
    id obj = [self objectForKey:key];
    return obj ? [obj doubleValue] : 0;    
}

@end

//
//  NSArray-Additions.m
//  Forecast
//
//  Created by Richard McClellan on 2/10/12.
//  Copyright (c) 2012 Forecast. All rights reserved.
//

#import "NSArray-Additions.h"

@implementation NSArray (Additions)


- (NSInteger) safeIndexOfObject:(id)obj {
    for(int i=0;i<self.count;i++) {
        id object = [self objectAtIndex:i];
        if([[object class] isMemberOfClass:[obj class]] && [obj isEqual:object]) {
            return i;
        }
    }
    return NSNotFound;
}
@end

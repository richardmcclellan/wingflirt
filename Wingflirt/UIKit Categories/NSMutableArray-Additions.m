//
//  NSMutableArray-Additions.m
//  Hurricane
//
//  Created by Richard McClellan on 10/16/10.
//  Copyright 2010 Hurricane Party Inc. All rights reserved.
//

#import "NSMutableArray-Additions.h"

@implementation NSMutableArray (NSMutableArray_Additions)

- (void) removeObjects:(NSArray *)objects {
	for (id object in objects) {
		[self removeObject:object];
	}
}

- (BOOL) doesntContainObject:(id)object {
	for(id obj in self) {
		if([obj isEqual:object]) {
			return NO;
		}
	}
	return YES;
}

- (void) addObjectsFromArrayNoDuplicates:(NSArray *)objects {
	for(id object in objects) {
		if(![self containsObject:object]) {
			[self addObject:object];
		}
	}
}

@end

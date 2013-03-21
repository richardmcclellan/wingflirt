//
//  NSMutableArray-Additions.h
//  Hurricane
//
//  Created by Richard McClellan on 10/16/10.
//  Copyright 2010 Hurricane Party Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSMutableArray (NSMutableArray_Additions) 

- (void) removeObjects:(NSArray *)objects;
- (BOOL) doesntContainObject:(id)object;
- (void) addObjectsFromArrayNoDuplicates:(NSArray *)objects;

@end

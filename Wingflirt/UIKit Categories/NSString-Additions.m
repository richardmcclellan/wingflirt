//
//  NSString-Additions.m
//  Forecast
//
//  Created by Richard McClellan on 6/22/11.
//  Copyright 2011 Hurricane Party. All rights reserved.
//

#import "NSString-Additions.h"


@implementation NSString (NSString_Additions)

- (NSString *)stringByMakingFirstLetterLowercase {
    NSString *firstLetter = [[self substringToIndex:1] lowercaseString];
    return [self stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:firstLetter];
}

- (CGSize)drawAtPoint:(CGPoint)point forWidth:(CGFloat)width withFont:(UIFont *)font singleLine:(BOOL)singleLine {
    if(singleLine) {
        return [self drawAtPoint:point forWidth:width withFont:font lineBreakMode:NSLineBreakByTruncatingTail];
    } else {
        return [self drawInRect:CGRectMake(point.x, point.y, width, 1000) withFont:font lineBreakMode:NSLineBreakByTruncatingTail];
    }
}

- (NSString *) stringWithCharactersInSet:(NSCharacterSet *)set {
    NSMutableString *newString = [NSMutableString string];
    for (int i=0; i<[self length]; i++) {
        if ([set characterIsMember:[self characterAtIndex:i]]) {
			[newString appendFormat:@"%c",[self characterAtIndex:i]];
        }
	}
    return newString;
}

@end

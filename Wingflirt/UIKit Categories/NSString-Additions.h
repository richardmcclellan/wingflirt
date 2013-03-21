//
//  NSString-Additions.h
//  Forecast
//
//  Created by Richard McClellan on 6/22/11.
//  Copyright 2011 Hurricane Party. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (NSString_Additions)

- (NSString *)stringByMakingFirstLetterLowercase;
- (CGSize)drawAtPoint:(CGPoint)point forWidth:(CGFloat)width withFont:(UIFont *)font singleLine:(BOOL)singleLine;
- (NSString *) stringWithCharactersInSet:(NSCharacterSet *)set;

@end

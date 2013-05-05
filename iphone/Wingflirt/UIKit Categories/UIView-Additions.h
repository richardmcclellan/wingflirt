//
//  UIView-Additions.h
//  Hurricane
//
//  Created by Richard McClellan on 2/7/11.
//  Copyright 2011 Hurricane Party Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIView (UIView_Additions) 

/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = left
 */
@property (nonatomic) CGFloat left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat centerY;

/**
 * Shortcut for origin
 *
 * Sets frame.origin = origin
 */
@property (nonatomic) CGPoint origin;

/**
 * Shortcut for size
 *
 * Sets frame.size = size
 */
@property (nonatomic) CGSize size;

/**
 * Utility method for debugging frame size
 *
 * Prints out the 4 values of the view's frame
 */
- (NSString *) frameDescription;

/**
 * Utility method for converting from a UIViewAnimationCurve to UIViewAnimationOptions
 *
 * Returns the UIViewAnimationOptions equivalent of curve.
 */
+ (UIViewAnimationOptions)animationOptionsWithCurve:(UIViewAnimationCurve)curve;

@end

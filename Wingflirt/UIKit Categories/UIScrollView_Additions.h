//
//  UIScrollView_Additions.h
//  Forecast
//
//  Created by Richard McClellan on 12/1/11.
//  Copyright (c) 2011 Forecast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (UIScrollView_Additions)

/**
 * Shortcut for contentInset.top
 *
 * Sets contentInset.top = top
 */
@property (nonatomic) CGFloat contentInsetTop;

/**
 * Shortcut for contentInset.left
 *
 * Sets contentInset.left = contentInsetLeft
 */
@property (nonatomic) CGFloat contentInsetLeft;

/**
 * Shortcut for contentInset.bottom
 *
 * Sets contentInset.bottom = contentInsetBottom
 */
@property (nonatomic) CGFloat contentInsetBottom;

/**
 * Shortcut for contentInset.right
 *
 * Sets contentInset.right = contentInsetRight
 */
@property (nonatomic) CGFloat contentInsetRight;

/**
 * Shortcut for contentOffset.x
 *
 * Sets contentOffset.x = contentOffsetX
 */
@property (nonatomic) CGFloat contentOffsetX;

/**
 * Shortcut for contentOffset.y
 *
 * Sets contentOffset.y = contentOffsetY
 */
@property (nonatomic) CGFloat contentOffsetY;

/**
 * Shortcut for contentSize.width
 *
 * Sets contentSize.width = contentWidth
 */
@property (nonatomic) CGFloat contentWidth;

/**
 * Shortcut for contentSize.height
 *
 * Sets contentSize.height = contentHeight
 */
@property (nonatomic) CGFloat contentHeight;

@end

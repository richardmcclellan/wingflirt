//
//  UIViewController-Additions.h
//  Hurricane
//
//  Created by Richard McClellan on 1/14/11.
//  Copyright 2011 Hurricane Party Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIViewController (UIViewController_Additions)

- (void) presentNavigationControllerWithViewController:(UIViewController *)controller animated:(BOOL)animated completion:(void (^)(BOOL finished))completion;
- (void) addLoadingView;
- (void) addLoadingViewWithText:(NSString *)text;
- (void) removeLoadingView;
- (void) printControllersForPath:(NSString *)path;

@end

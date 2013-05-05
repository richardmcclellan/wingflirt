//
//  BaseViewDelegate.h
//  Forecast
//
//  Created by Richard McClellan on 5/30/11.
//  Copyright 2011 Hurricane Party. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol BaseViewDelegate <NSObject>

- (void) delegatePushViewController:(UIViewController *)controller animated:(BOOL)animated;
- (void) delegatePopViewControllerAnimated:(BOOL)animated;
- (void) delegatePresentViewController:(UIViewController *)controller animated:(BOOL)animated;
- (void) delegatePresentNavigationControllerWithViewController:(UIViewController *)controller animated:(BOOL)animated;
- (void) delegateDismissViewControllerAnimated:(BOOL)animated;

@end

//
//  BaseViewController.m
//  Forecast
//
//  Created by Richard McClellan on 6/28/11.
//  Copyright 2011 Hurricane Party. All rights reserved.
//

#import "BaseViewController.h"
#import "ListViewController.h"

@implementation BaseViewController

@synthesize adjustViewWithKeyboard;

- (id)init {
    if((self = [super initWithNibName:nil bundle:nil])) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if(adjustViewWithKeyboard) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(baseKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(baseKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    }
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if(adjustViewWithKeyboard) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    }
}


- (void) moveViewForKeyboard:(NSNotification*)notification up:(BOOL)up{
    NSDictionary* userInfo = [notification userInfo];
    CGRect endRect = [self.view convertRect:[[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue] fromView:nil];
    CGFloat height = self.view.height + endRect.size.height * (up ? -1 : 1);
    NSTimeInterval duration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationCurve curve = [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
    UIViewAnimationOptions options = [UIView animationOptionsWithCurve:curve];
    [UIView animateWithDuration:duration delay:0 options:options animations:^{ [self.view setHeight:height]; } completion:nil];
}

- (void) baseKeyboardWillHide:(NSNotification *)notification {
    [self moveViewForKeyboard:notification up:NO];
}

- (void) baseKeyboardWillShow:(NSNotification *)notification {
    [self moveViewForKeyboard:notification up:YES];
}

#pragma mark -
#pragma mark BaseViewDelegate
- (void) delegatePushViewController:(UIViewController *)controller animated:(BOOL)animated {
    [self.navigationController pushViewController:controller animated:animated];
}

- (void) delegatePopViewControllerAnimated:(BOOL)animated {
    [self.navigationController popViewControllerAnimated:animated];
}

- (void) delegatePresentViewController:(UIViewController *)controller animated:(BOOL)animated {
    [self presentViewController:controller animated:animated completion:NULL];
}

- (void) delegatePresentNavigationControllerWithViewController:(UIViewController *)controller animated:(BOOL)animated {
    [self presentNavigationControllerWithViewController:controller animated:animated completion:NULL];
}

- (void) delegateDismissViewControllerAnimated:(BOOL)animated {
    [self dismissViewControllerAnimated:animated completion:NULL];
}

@end

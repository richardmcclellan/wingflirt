//
//  UIViewController-Additions.m
//  Hurricane
//
//  Created by Richard McClellan on 1/14/11.
//  Copyright 2011 Hurricane Party Inc. All rights reserved.
//

#import "UIViewController-Additions.h"

static const NSInteger loadingViewTag = 292;
static NSString *controllerKey = @"controller";
static NSString *animatedKey = @"animated";
static NSString *completionKey = @"completion";

@implementation UIViewController (UIViewController_Additions)

- (void) presentNavigationControllerWithUserInfo:(NSDictionary *)userInfo {
    if([[UIApplication sharedApplication] isIgnoringInteractionEvents]) {
        [self performSelector:@selector(presentNavigationControllerWithUserInfo:) withObject:userInfo afterDelay:0.1];
    } else {
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[userInfo objectForKey:controllerKey]];
        [navigationController.navigationBar setBackgroundImage:[UIImage imageNamed: @"header.png"] forBarMetrics:UIBarMetricsDefault];
        [navigationController.navigationBar setTintColor:[WFStyle tintColor]];
        [self presentViewController:navigationController animated:[userInfo boolForKey:animatedKey] completion:[userInfo objectForKey:completionKey]];
    }
}

- (void) presentNavigationControllerWithViewController:(UIViewController *)controller animated:(BOOL)animated completion:(void (^)(BOOL finished))completion {
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithCapacity:2];
    [userInfo setObject:controller forKey:controllerKey];
    [userInfo setObject:[NSNumber numberWithBool:animated] forKey:animatedKey];
    if(completion != NULL) {
        [userInfo setObject:completion forKey:completionKey];
    }
    [self presentNavigationControllerWithUserInfo:userInfo];
}
         
- (void) addLoadingView {
	[self addLoadingViewWithText:@"Loading..."];
}

- (void) addLoadingViewWithText:(NSString *)text {
	UIView *loadingView = [[UIView alloc] initWithFrame:self.view.bounds];
    [loadingView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
//	[loadingView setBackgroundColor:[WFStyle forecastLighterGrayColor]];
	[loadingView setTag:loadingViewTag];
	
    UILabel *loadingLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	loadingLabel.backgroundColor = [UIColor clearColor];
	loadingLabel.font = [WFStyle fontOfSize:15.0];
//	loadingLabel.textColor = [WFStyle forecastDarkGrayColor];
	[loadingLabel setText:text];
	[loadingLabel sizeToFit];
    
	UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityIndicator setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin];
	[activityIndicator startAnimating];
    [activityIndicator setLeft:(self.view.width - activityIndicator.width - loadingLabel.width - 5.0) / 2];
    [activityIndicator setTop:(self.view.height - activityIndicator.height) / 2];
	[loadingView addSubview:activityIndicator];
	
    [loadingLabel setLeft:(self.view.width - activityIndicator.width - loadingLabel.width - 5.0) / 2 + activityIndicator.width + 5.0];
    [loadingLabel setTop:(self.view.height - loadingLabel.height) / 2];
    [loadingLabel setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin];
	[loadingView addSubview:loadingLabel];
    
	[self.view addSubview:loadingView];
}


- (void) removeLoadingView {
	UIView *loadingView = nil;
	while ((loadingView = [self.view viewWithTag:loadingViewTag])) {
		[loadingView removeFromSuperview];
	}
}

- (void) printControllersForPath:(NSString *)path{
    BOOL done = YES;
    NSMutableArray *alreadyExaminedControllers = [NSMutableArray array];
    if(self.parentViewController) {
        done = NO;
        [self.parentViewController printControllersForPath:[path stringByAppendingFormat:@"parentViewController(%@)\n", [[self.parentViewController class] description]]];
        [alreadyExaminedControllers addObject:self.parentViewController];
    }
    
    if(self.navigationController && ![alreadyExaminedControllers containsObject:self.navigationController]) {
        done = NO;
        NSString *tmpPath = [path stringByAppendingFormat:@"navigationController(%@):(", [[self.navigationController class] description]];
        for(UIViewController *controller in self.navigationController.viewControllers) {
            tmpPath = [tmpPath stringByAppendingFormat:@"controller: %@  ", [[controller class] description]];
        }

        tmpPath = [tmpPath stringByAppendingFormat:@")\n"];
        [self.navigationController printControllersForPath:tmpPath];
        [alreadyExaminedControllers addObject:self.navigationController];
    }
    
    if(self.tabBarController && ![alreadyExaminedControllers containsObject:self.tabBarController]) {
        done = NO;
        NSString *tmpPath = [path stringByAppendingFormat:@"tabBarController(%@):(", [[self.tabBarController class] description]];
        for(UIViewController *controller in self.tabBarController.viewControllers) {
            tmpPath = [tmpPath stringByAppendingFormat:@"controller: %@  ", [[controller class] description]];
        }
        tmpPath = [tmpPath stringByAppendingFormat:@")\n"];
        [alreadyExaminedControllers addObject:self.tabBarController];
        [self.tabBarController printControllersForPath:tmpPath];

    }
    
    if(self.presentedViewController && ![alreadyExaminedControllers containsObject:self.presentedViewController]) {
        done = NO;
        [self.presentedViewController printControllersForPath:[path stringByAppendingFormat:@"modalViewController(%@)\n", [[self.presentedViewController class] description]]];
    }
    if(done) {
        DLog(@"%@",path);
    }
}


@end

//
//  PullToRefreshTableView.m
//  Hurricane
//
//  Created by Richard McClellan on 10/4/10.
//  Copyright 2010 Hurricane Party Inc. All rights reserved.
//

#import "PullToRefreshTableView.h"
#import "UIColor-HSVAdditions.h"

#define kReleaseToReloadStatus 0
#define kPullToReloadStatus 1
#define kLoadingStatus 2
#define REFRESH_HEADER_HEIGHT 65.0f

@interface PullToRefreshTableView (Private)

@end


@implementation PullToRefreshTableView

@synthesize refreshDelegate;
@synthesize refreshHeaderView;

- (id) initWithFrame:(CGRect)frame style:(UITableViewStyle)newStyle {
	if((self = [super initWithFrame:frame style:newStyle])) {
        refreshHeaderView = [[RefreshHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.bounds.size.height, 320.0f, self.bounds.size.height)];
		[refreshHeaderView setLastUpdatedDate:[NSDate date]];
		[self addSubview:refreshHeaderView];
	}
	return self;
}

- (void)didFinishRefreshing {
	reloading = NO;
	[refreshHeaderView flipImageAnimated:NO];
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.3];
	[self setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, self.contentInset.bottom, 0.0f)];
	[refreshHeaderView setStatus:kPullToReloadStatus];
	[refreshHeaderView setLastUpdatedDate:[NSDate date]];
	[refreshHeaderView toggleActivityView:NO];
	[UIView commitAnimations];
}

- (void) showReloadAnimationAnimated:(BOOL)animated {
	reloading = YES;
	[refreshHeaderView toggleActivityView:YES];
	if (animated) {
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.2];
		self.contentInset = UIEdgeInsetsMake(REFRESH_HEADER_HEIGHT, 0.0f, self.contentInset.bottom, 0.0f);
		[UIView commitAnimations];
	} else {
		self.contentInset = UIEdgeInsetsMake(REFRESH_HEADER_HEIGHT, 0.0f, self.contentInset.bottom, 0.0f);
	}
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
	if (!reloading) {
		checkForRefresh = YES;  //  only check offset when dragging
	}
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	if (reloading) {
        // Update the content inset, good for section headers
        if (scrollView.contentOffset.y >= 0) {
            self.contentInset = UIEdgeInsetsMake(0.0, 0.0, self.contentInset.bottom, 0.0);
        } else if (scrollView.contentOffset.y < REFRESH_HEADER_HEIGHT) {
            self.contentInset = UIEdgeInsetsMake(MIN(-scrollView.contentOffset.y, REFRESH_HEADER_HEIGHT), 0.0, self.contentInset.bottom, 0.0);
        }
        return;
	}
    
	if (checkForRefresh) {
		if (refreshHeaderView.isFlipped && scrollView.contentOffset.y > -REFRESH_HEADER_HEIGHT && scrollView.contentOffset.y < 0.0f && !reloading) {
			[refreshHeaderView flipImageAnimated:YES];
			[refreshHeaderView setStatus:kPullToReloadStatus];	
		} else if (!refreshHeaderView.isFlipped && scrollView.contentOffset.y < -REFRESH_HEADER_HEIGHT) {
			[refreshHeaderView flipImageAnimated:YES];
			[refreshHeaderView setStatus:kReleaseToReloadStatus];
		}
	}
    if([((NSObject *)self.refreshDelegate) respondsToSelector:@selector(pullToRefreshTableViewDidScroll:)]) {
       [self.refreshDelegate pullToRefreshTableViewDidScroll:self];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
	if (reloading) return;
	
	if (scrollView.contentOffset.y <= -REFRESH_HEADER_HEIGHT) {
		[self showReloadAnimationAnimated:YES];
		[self.refreshDelegate refresh];
	}
	checkForRefresh = NO;
}

@end

//
//  PullToRefreshTableView.h
//  Hurricane
//
//  Created by Richard McClellan on 10/4/10.
//  Copyright 2010 Hurricane Party Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshHeaderView.h"
#import "BaseTableView.h"

@class PullToRefreshTableView;

@protocol PullToRefreshTableViewDelegate

-(void) refresh;

@optional
-(void) pullToRefreshTableViewDidScroll:(PullToRefreshTableView *)tableView;

@end


@interface PullToRefreshTableView : BaseTableView <UIScrollViewDelegate> {
	id<PullToRefreshTableViewDelegate> __weak refreshDelegate; 
	RefreshHeaderView *refreshHeaderView;
	BOOL checkForRefresh;
	BOOL reloading;
}

@property (nonatomic, weak) id<PullToRefreshTableViewDelegate> refreshDelegate;
@property (nonatomic, strong) RefreshHeaderView *refreshHeaderView;

- (void)didFinishRefreshing;
- (void) showReloadAnimationAnimated:(BOOL)animated;

@end

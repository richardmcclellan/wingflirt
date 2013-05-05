//
//  DetailTableView.h
//  Wingflirt
//
//  Created by Richard McClellan on 3/26/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import "PullToRefreshTableView.h"
#import "Message.h"
#import "Comment.h"
#import "BaseViewDelegate.h"
#import "DetailHeaderView.h"

@protocol DetailTableViewDelegate

- (void) didSingleTap;

@end

@interface DetailTableView : PullToRefreshTableView {
    id<BaseViewDelegate> __weak viewDelegate;
    id<DetailTableViewDelegate> __weak detailTableViewDelegate;
    Message *message;
    BOOL singleTapPossible;
}

- (id)initWithFrame:(CGRect)frame viewDelegate:(id)vDelegate;
- (void) configureWithMessage:(Message *)aMessage;

@end

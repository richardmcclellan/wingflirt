//
//  ListTableView.h
//  Wingflirt
//
//  Created by Richard McClellan on 3/20/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import "PullToRefreshTableView.h"
#import "MessageCell.h"
#import "BaseViewDelegate.h"

@interface ListTableView : PullToRefreshTableView {
    id<BaseViewDelegate> __weak viewDelegate;
    NSArray *messages;
}

- (id)initWithFrame:(CGRect)frame viewDelegate:(id)vDelegate;
- (void) configureWithMessages:(NSArray *)aMessages;

@end

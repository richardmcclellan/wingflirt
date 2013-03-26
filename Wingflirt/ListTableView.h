//
//  ListTableView.h
//  Wingflirt
//
//  Created by Richard McClellan on 3/20/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import "PullToRefreshTableView.h"
#import "MessageCell.h"

@interface ListTableView : PullToRefreshTableView {
    NSArray *messages;
}

- (void) configureWithMessages:(NSArray *)aMessages;

@end

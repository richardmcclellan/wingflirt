//
//  DetailViewController.h
//  Wingflirt
//
//  Created by Richard McClellan on 3/20/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"
#import "Comment.h"
#import "BaseViewController.h"
#import "PostingView.h"
#import "DetailTableView.h"
#import "DetailHeaderView.h"

@interface DetailViewController : BaseViewController <PostingViewDelegate> {
    DetailTableView *detailTableView;
    DetailHeaderView *detailHeaderView;
    PostingView *postingView;
    Message *message;
}

- (id)initWithMessage:(Message *)aMessage;

@end

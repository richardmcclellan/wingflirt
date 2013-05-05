//
//  DetailViewController.m
//  Wingflirt
//
//  Created by Richard McClellan on 3/20/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithMessage:(Message *)aMessage {
    if((self = [super initWithNibName:nil bundle:nil])) {
        message = aMessage;
        
        self.adjustViewWithKeyboard = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    CGRect tableFrame, postingViewFrame;
    CGRectDivide(self.view.bounds, &postingViewFrame, &tableFrame, 44, CGRectMaxYEdge);
    
    detailTableView = [[DetailTableView alloc] initWithFrame:tableFrame viewDelegate:self];
    [self.view addSubview:detailTableView];
    
    detailHeaderView = [[DetailHeaderView alloc] initWithFrame:tableFrame];
    
    postingView = [[PostingView alloc] initWithFrame:postingViewFrame];
    postingView.delegate = self;
    postingView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:postingView];
    
    [self refresh];
    [self loadContent];
}

- (void) refresh {
    PFQuery *query = [Message query];
    query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    [query whereKey:@"message" equalTo:message];
    __block BOOL gettingCachedResult = [query hasCachedResult];
    [query getObjectInBackgroundWithId:message.objectId block:^(PFObject *object, NSError *error) {
        if(!error) {
            message = (Message *)object;
            [self loadContent];
            if(!gettingCachedResult) {  
                [detailTableView didFinishRefreshing];
            }
            gettingCachedResult = NO;
        }
    }];
}

- (void) loadContent {
    [detailTableView configureWithMessage:message];
    [detailHeaderView configureWithMessage:message];
    [detailTableView setTableHeaderView:detailHeaderView];
}

#pragma mark -
#pragma mark PostingViewDelegate

- (void) postingView:(PostingView *)view willChangeHeight:(float)height {
    [postingView setTop:self.view.height - height];
    [detailTableView setHeight:postingView.top - detailTableView.top + 2];
}

- (void) sendText:(NSString *)text {
    Comment *comment = [Comment object];
    comment.text = text;
    if(message.comments == nil) {
        message.comments = [NSMutableArray array];
    }
    [message.comments addObject:comment];
    [message saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(succeeded) {
            [self loadContent];
            [detailTableView scrollToBottom];
            [postingView didFinishPosting];
        }
    }];
}

#pragma mark
#pragma mark CommentTableViewDelegate
- (void) didSingleTap {
    [postingView resignFirstResponder];
}

@end

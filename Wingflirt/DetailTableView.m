//
//  DetailTableView.m
//  Wingflirt
//
//  Created by Richard McClellan on 3/26/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import "DetailTableView.h"
#import "CommentCell.h"

static NSString *cellIdentifier = @"CommentCellIdentifier";

@implementation DetailTableView

- (id)initWithFrame:(CGRect)frame viewDelegate:(id)vDelegate {
    if((self = [super initWithFrame:frame style:UITableViewStylePlain])) {
        [self registerClass:[CommentCell class] forCellReuseIdentifier:cellIdentifier];
        self.delegate = self;
        self.dataSource = self;
        viewDelegate = vDelegate;
        refreshDelegate = vDelegate;
        detailTableViewDelegate = vDelegate;
        self.backgroundColor = [WFStyle lightestGrayColor];
    }
    return self;
}

- (void) configureWithMessage:(Message *)aMessage {
    message = aMessage;
    [self reloadData];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event { singleTapPossible = YES; }
- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event { singleTapPossible = NO; }
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if(singleTapPossible) {
        singleTapPossible = NO;
        [detailTableViewDelegate didSingleTap];
    }
}

#pragma mark -
#pragma mark UITableViewDelegate and UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return message.comments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell configureWithComment:message.comments[indexPath.row]];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [CommentCell heightForComment:message.comments[indexPath.row]];
}


@end

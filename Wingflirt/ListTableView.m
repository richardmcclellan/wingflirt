//
//  ListTableView.m
//  Wingflirt
//
//  Created by Richard McClellan on 3/20/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import "ListTableView.h"
#import "DetailViewController.h"

static NSString *cellIdentifier = @"MessageCellIdentifier";

@implementation ListTableView

- (id)initWithFrame:(CGRect)frame viewDelegate:(id)vDelegate {
    if((self = [super initWithFrame:frame style:UITableViewStylePlain])) {
        [self registerClass:[MessageCell class] forCellReuseIdentifier:cellIdentifier];
        viewDelegate = vDelegate;
        refreshDelegate = vDelegate;
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (void) configureWithMessages:(NSArray *)aMessages {
    messages = aMessages;
    [self reloadData];
}

#pragma mark - 
#pragma mark UITableViewDelegate and UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell configureWithMessage:messages[indexPath.row]];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *dVC = [[DetailViewController alloc] initWithMessage:messages[indexPath.row]];
    [viewDelegate delegatePushViewController:dVC animated:YES];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [MessageCell heightForMessage:messages[indexPath.row]];
}

@end

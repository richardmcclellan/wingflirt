//
//  ListTableView.m
//  Wingflirt
//
//  Created by Richard McClellan on 3/20/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import "ListTableView.h"

@implementation ListTableView

- (id)initWithFrame:(CGRect)frame {
    if((self = [super initWithFrame:frame])) {

    }
    return self;
}

#pragma mark - 
#pragma mark UITableViewDelegate and UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
}


@end

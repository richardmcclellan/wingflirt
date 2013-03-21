//
//  ListViewController.m
//  Wingflirt
//
//  Created by Richard McClellan on 3/20/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (id)init {
    if((self = [super initWithNibName:nil bundle:nil])) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ListTableView *listTableView = [[ListTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [listTableView loadTableWithMessages:self.messages];
    [self.view addSubview:listTableView];
}

@end

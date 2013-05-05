//
//  ListViewController.m
//  Wingflirt
//
//  Created by Richard McClellan on 3/20/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import "ListViewController.h"
#import "CreateViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (id)init {
    if((self = [super initWithNibName:nil bundle:nil])) {
        self.navigationItem.titleView = [WFStyle defaultTitleView];
        UIBarButtonItem *addMessageButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addMessage)];
        [self.navigationItem setRightBarButtonItem:addMessageButton];
        
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
		[self.navigationItem setBackBarButtonItem:backButton];
    }
    return self;
}

- (void) addMessage {
    CreateViewController *cmVC = [[CreateViewController alloc] init];
    [self.navigationController presentNavigationControllerWithViewController:cmVC animated:YES completion:NULL];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    listTableView = [[ListTableView alloc] initWithFrame:self.view.bounds viewDelegate:self];
    [self.view addSubview:listTableView];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadContent];
    [self refresh];
}

- (void) loadContent {
    [listTableView configureWithMessages:messages];
}

- (void) refresh {
    PFQuery *query = [Message query];
    query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    [query includeKey:@"comments"];
    __block BOOL gettingCachedResult = [query hasCachedResult];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"response %@", objects);
            messages = objects;
            [self loadContent];
            if(!gettingCachedResult) {
                [listTableView didFinishRefreshing];
            }
            gettingCachedResult = NO;
        }
    }];
}

@end

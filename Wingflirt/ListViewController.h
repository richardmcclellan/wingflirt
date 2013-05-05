//
//  ListViewController.h
//  Wingflirt
//
//  Created by Richard McClellan on 3/20/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListTableView.h"
#import "BaseViewController.h"

@interface ListViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate, PullToRefreshTableViewDelegate> {
    ListTableView *listTableView;
    NSArray *messages;
}



@end

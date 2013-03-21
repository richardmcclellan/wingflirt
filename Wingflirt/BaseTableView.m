//
//  BaseTableView.m
//  Forecast
//
//  Created by Richard McClellan on 5/22/11.
//  Copyright 2011 Hurricane Party. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

@synthesize content;
@synthesize cellClass;

- (id) initWithFrame:(CGRect)frame style:(UITableViewStyle)newStyle {
    if((self = [super initWithFrame:frame style:newStyle])) {
        self.delegate = self;
        self.dataSource = self;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.showsVerticalScrollIndicator = YES;
        self.backgroundColor = [WFStyle forecastLighterGrayColor];
        self.separatorColor = [WFStyle forecastSlightLightGrayColor];
        [self setContentInsetBottom:newStyle == UITableViewStylePlain ? -2 : 0];
    }
    return self;
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return nil;
}

// These methods prevent empty cells from appearing at the bottom of table views
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if(self.style == UITableViewStylePlain) {
        if(section == [self numberOfSections] - 1) {
            return 1;
        } else {
            return 0;
        }
    } else {
        return 10;
    }
}

@end

//
//  BaseTableView.h
//  Forecast
//
//  Created by Richard McClellan on 5/22/11.
//  Copyright 2011 Hurricane Party. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseTableView : UITableView <UITableViewDelegate, UITableViewDataSource> {
    NSArray *content;
    Class cellClass;
}

@property (nonatomic, strong) NSArray *content;
@property (nonatomic, assign) Class cellClass;

@end

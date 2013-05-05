//
//  DetailHeaderView.h
//  Wingflirt
//
//  Created by Richard McClellan on 3/30/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"

@interface DetailHeaderView : UIView {
    UILabel *headerLabel;
}


- (void) configureWithMessage:(Message *)message;

@end

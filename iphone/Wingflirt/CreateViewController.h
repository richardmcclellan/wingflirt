//
//  CreateViewController.h
//  Wingflirt
//
//  Created by Richard McClellan on 3/21/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateViewController : UIViewController <UITextViewDelegate> {
    UIBarButtonItem *postButton;
    UITextView *messageTextView;
    UILabel *placeholderLabel;
}

@end

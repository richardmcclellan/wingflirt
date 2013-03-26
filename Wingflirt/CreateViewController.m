//
//  CreateViewController.m
//  Wingflirt
//
//  Created by Richard McClellan on 3/21/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import "CreateViewController.h"
#import "Message.h"

@interface CreateViewController ()

@end

@implementation CreateViewController

- (id)init {
    if((self = [super initWithNibName:nil bundle:nil])) {
		self.navigationItem.titleView = [WFStyle defaultTitleView];
		UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel block:^(id sender){
            [self.parentViewController dismissViewControllerAnimated:YES completion:NULL];
        }];
		[self.navigationItem setLeftBarButtonItem:cancelButton];
        
		postButton = [[UIBarButtonItem alloc] initWithTitle:@"Post" style:UIBarButtonItemStyleBordered block:^(id sender){
            Message *message = [Message object];
            message.text = messageTextView.text;
            [message saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if(succeeded) {
                    [self.parentViewController dismissViewControllerAnimated:YES completion:NULL];
                }
            }];
        }];
        [postButton setEnabled:NO];
		[self.navigationItem setRightBarButtonItem:postButton];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[WFStyle bgColor]];
    
    CGRect messageFrame = CGRectInset(self.view.bounds,20,20);
    messageFrame.size.height -= 216;
    messageTextView = [[UITextView alloc] initWithFrame:messageFrame];
    messageTextView.layer.cornerRadius = 10.0;
    [messageTextView setFont:[WFStyle largeFont]];
    [messageTextView setBackgroundColor:[WFStyle elementColor]];
    messageTextView.delegate = self;
    [messageTextView becomeFirstResponder];
    [self.view addSubview:messageTextView];
    
    placeholderLabel = [[UILabel alloc] initWithFrame:CGRectInset(messageTextView.frame, 10, 10)];
    [placeholderLabel setNumberOfLines:0];
    [placeholderLabel setBackgroundColor:[UIColor clearColor]];
    [placeholderLabel setTextColor:[UIColor grayColor]];
    [placeholderLabel setFont:[WFStyle largeFont]];
    [placeholderLabel setText:@"Need some help responding to a text?  Paste it here!"];
    [placeholderLabel sizeToFit];
    [self.view addSubview:placeholderLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UITextViewDelegate

- (void) textViewDidChange:(UITextView *)textView {
    BOOL hasText = textView.text.length > 0;
    [placeholderLabel setHidden:hasText];
    [postButton setEnabled:hasText];
}

@end

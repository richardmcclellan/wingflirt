//
//  PostingView.m
//  Forecast
//
//  Created by Richard McClellan on 5/22/11.
//  Copyright 2011 Hurricane Party. All rights reserved.
//

#import "PostingView.h"

@implementation PostingView

static NSInteger baseTextViewHeight = 34;

@synthesize delegate;
@synthesize growingTextView;
@synthesize sendButton;
@synthesize charCountLabel;
@synthesize activityIndicator;

- (id)initWithFrame:(CGRect)frame {
    if((self = [super initWithFrame:frame])) {
        UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"comment_field_bg.png"]];
        [bgView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        [bgView setFrame:self.bounds];
        [self addSubview:bgView];
        
        self.growingTextView = [[HPGrowingTextView alloc] initWithFrame:CGRectMake(7, 5, 240, baseTextViewHeight)];
        self.growingTextView.delegate = self;
        [self addSubview:self.growingTextView];

        CGRect frame = CGRectMake(250, 4, 65, 26);
        self.charCountLabel = [[UILabel alloc] initWithFrame:frame];
        self.charCountLabel.backgroundColor = [UIColor clearColor];
        self.charCountLabel.font = [WFStyle smallFont];
        self.charCountLabel.textAlignment = NSTextAlignmentCenter;
        self.charCountLabel.hidden = YES;
        self.charCountLabel.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
        [self addSubview:self.charCountLabel];
        
        frame.origin.y = 9;
        self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        self.activityIndicator.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
        [self.activityIndicator setTop:frame.origin.y + (frame.size.height - self.activityIndicator.height)/2];
        [self.activityIndicator setLeft:frame.origin.x + (frame.size.width - self.activityIndicator.width)/2];
        self.activityIndicator.hidesWhenStopped = YES;
        [self addSubview:self.activityIndicator];
        
        self.sendButton = [[UIButton alloc] initWithFrame:frame];
        UIImage *buttonImage = [[UIImage imageNamed:@"compose_atom_selected.png"] stretchableImageWithLeftCapWidth:13 topCapHeight:13];
        [self.sendButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        [self.sendButton setAdjustsImageWhenDisabled:NO];
        [self.sendButton setTitle:@"Send" forState:UIControlStateNormal];
        [self.sendButton.titleLabel setFont:[WFStyle boldFontOfSize:16.0]];
        [self.sendButton setTitleColor:[WFStyle lightestGrayColor] forState:UIControlStateNormal];
        [self.sendButton setTitleColor:[WFStyle lightGrayColor] forState:UIControlStateDisabled];
        self.sendButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
        [self.sendButton addTarget:self action:@selector(send:) forControlEvents:UIControlEventTouchUpInside];
        [self.sendButton setEnabled:NO];
        [self addSubview:self.sendButton];
    }
    return self;
}

- (BOOL) becomeFirstResponder {
    [self.growingTextView becomeFirstResponder];
    return NO;
}

- (BOOL) resignFirstResponder {
    return [self.growingTextView resignFirstResponder];
}

- (void) send:(id)sender {
    [self.activityIndicator startAnimating];
    [self.sendButton setHidden:YES];
    [self.delegate sendText:self.growingTextView.text];
    [self.growingTextView resignFirstResponder];
    [self.growingTextView setUserInteractionEnabled:NO];
}

- (void) didFinishPosting {
    [self.growingTextView setUserInteractionEnabled:YES];
    [self.growingTextView setHeight:baseTextViewHeight - 10];
    [self growingTextView:self.growingTextView willChangeHeight:baseTextViewHeight];
    [self.growingTextView reset];
    [self.sendButton setEnabled:NO];
    [self.sendButton setHidden:NO];
    [self.activityIndicator stopAnimating];
}

#pragma mark -
#pragma mark HPGrowingTextViewDelegate
- (void)growingTextView:(HPGrowingTextView *)growingTextView willChangeHeight:(float)height {
    [self.delegate postingView:self willChangeHeight:height+10];
    [self setHeight:height+10];
    [self.charCountLabel setHidden:(height <= baseTextViewHeight)];
}

- (void) growingTextViewDidChange:(HPGrowingTextView *)aGrowingTextView {
    NSInteger remainingChars = 200 - [self.growingTextView.text length];
    self.charCountLabel.text = [NSString stringWithFormat:@"%d", remainingChars];
    if (remainingChars < 0 || [self.growingTextView.text length] == 0) {
        [self.charCountLabel setTextColor:[UIColor redColor]];
        [self.sendButton setEnabled:NO];
    } else {
        [self.charCountLabel setTextColor:[WFStyle darkGrayColor]];
        [self.sendButton setEnabled:YES];
    }
}

@end

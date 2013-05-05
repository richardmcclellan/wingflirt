//
//  PostingView.h
//  Forecast
//
//  Created by Richard McClellan on 5/22/11.
//  Copyright 2011 Hurricane Party. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPGrowingTextView.h"

@class PostingView;

@protocol PostingViewDelegate <NSObject>

- (void) postingView:(PostingView *)postingView willChangeHeight:(float)height;
- (void) sendText:(NSString *)text;

@end

@interface PostingView : UIView <HPGrowingTextViewDelegate> {
    id<PostingViewDelegate> __weak delegate;
    HPGrowingTextView *growingTextView;
    UIButton *sendButton;
    UILabel *charCountLabel;
    UIActivityIndicatorView *activityIndicator;
}

@property (nonatomic, weak) id<PostingViewDelegate> delegate;
@property (nonatomic, strong) HPGrowingTextView *growingTextView;
@property (nonatomic, strong) UIButton *sendButton;
@property (nonatomic, strong) UILabel *charCountLabel;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

- (void) didFinishPosting;

@end

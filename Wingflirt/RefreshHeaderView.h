//
//  RefreshHeaderView.h
//  Hurricane
//
//  Created by Richard McClellan on 9/27/10.
//  Copyright 2010 Hurricane Party Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RefreshHeaderView : UIView {
	
	UILabel *lastUpdatedLabel;
	UILabel *statusLabel;
	UIImageView *arrowImage;
	UIActivityIndicatorView *activityView;
	
	BOOL isFlipped;
	
	NSDate *lastUpdatedDate;
}
@property BOOL isFlipped;

@property (nonatomic, strong) NSDate *lastUpdatedDate;

- (void)flipImageAnimated:(BOOL)animated;
- (void)toggleActivityView:(BOOL)isON;
- (void)setStatus:(int)status;
- (void)setLastUpdatedText:(NSString *)text;

@end

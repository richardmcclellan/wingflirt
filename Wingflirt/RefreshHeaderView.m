//
//  RefreshHeaderView.m
//  Hurricane
//
//  Created by Richard McClellan on 9/27/10.
//  Copyright 2010 Hurricane Party Inc. All rights reserved.
//

#import "RefreshHeaderView.h"

#define kReleaseToReloadStatus	0
#define kPullToReloadStatus		1
#define kLoadingStatus			2

@implementation RefreshHeaderView

@synthesize isFlipped, lastUpdatedDate;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame]))
	{
		self.backgroundColor = [WFStyle lightestGrayColor];
		lastUpdatedLabel = [[UILabel alloc] initWithFrame:
							CGRectMake(0.0f, frame.size.height - 30.0f,
									   320.0f, 20.0f)];
		lastUpdatedLabel.font = [WFStyle fontOfSize:12.0f];
//		lastUpdatedLabel.textColor = [WFStyle defaultTextColor];
//		lastUpdatedLabel.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
//		lastUpdatedLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
		lastUpdatedLabel.backgroundColor = self.backgroundColor;
		lastUpdatedLabel.opaque = YES;
		lastUpdatedLabel.textAlignment = NSTextAlignmentCenter;
		lastUpdatedLabel.hidden = YES;
		[self addSubview:lastUpdatedLabel];
		
		statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - 39.0f, 320.0f, 20.0f)];
		statusLabel.font = [WFStyle fontOfSize:14.0];
		statusLabel.textColor = [WFStyle forecastGrayColor];
//		statusLabel.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
//		statusLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
		statusLabel.backgroundColor = self.backgroundColor;
		statusLabel.opaque = YES;
		statusLabel.textAlignment = NSTextAlignmentCenter;
		[self setStatus:kPullToReloadStatus];
		[self addSubview:statusLabel];
		
		arrowImage = [[UIImageView alloc] initWithFrame:
					  CGRectMake(25.0f, frame.size.height
								 -65.0f, 30.0f, 55.0f)];
		arrowImage.contentMode = UIViewContentModeScaleAspectFit;
		arrowImage.image = [UIImage imageNamed:@"gray_arrow.png"];
		[arrowImage layer].transform =
		CATransform3DMakeRotation(M_PI, 0.0f, 0.0f, 1.0f);
		[self addSubview:arrowImage];
		
		activityView = [[UIActivityIndicatorView alloc]
						initWithActivityIndicatorStyle:
						UIActivityIndicatorViewStyleGray];
		activityView.frame = CGRectMake(25.0f, frame.size.height
										- 38.0f, 20.0f, 20.0f);
		activityView.hidesWhenStopped = YES;
		[self addSubview:activityView];
		
		isFlipped = NO;
    }
    return self;
}

- (void) setBackgroundColor:(UIColor *)color {
    [super setBackgroundColor:color];
}

//- (void)drawRect:(CGRect)rect{
//	CGContextRef context = UIGraphicsGetCurrentContext();
//	CGContextDrawPath(context,  kCGPathFillStroke);
//	[[WFStyle forecastGrayColor] setStroke];
//	CGContextBeginPath(context);
//	CGContextMoveToPoint(context, 0.0f, self.bounds.size.height - 1);
//	CGContextAddLineToPoint(context, self.bounds.size.width,
//							self.bounds.size.height - 1);
//	CGContextStrokePath(context);
//}

- (void)flipImageAnimated:(BOOL)animated {
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:animated ? .18 : 0.0];
	[arrowImage layer].transform = isFlipped ?
	CATransform3DMakeRotation(M_PI, 0.0f, 0.0f, 1.0f) :
	CATransform3DMakeRotation(M_PI * 2, 0.0f, 0.0f, 1.0f);
	[UIView commitAnimations];
	
	isFlipped = !isFlipped;
}

- (void)setLastUpdatedDate:(NSDate *)newDate
{
	if (newDate)
	{
		
		lastUpdatedDate = newDate;
		
		NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
		[formatter setDateStyle:NSDateFormatterShortStyle];
		[formatter setTimeStyle:NSDateFormatterShortStyle];
		lastUpdatedLabel.text = [NSString stringWithFormat:
								 @"Last Updated: %@", [formatter stringFromDate:lastUpdatedDate]];
	}
	else
	{
		lastUpdatedDate = nil;
		lastUpdatedLabel.text = @"Last Updated: Never";
	}
}

- (void)setLastUpdatedText:(NSString *)text {
	lastUpdatedLabel.text = text;
}

- (void)setStatus:(int)status
{
	switch (status) {
		case kReleaseToReloadStatus:
			statusLabel.text = @"Release to refresh...";
			break;
		case kPullToReloadStatus:
			statusLabel.text = @"Pull down to refresh...";
			break;
		case kLoadingStatus:
			statusLabel.text = @"Loading...";
			break;
		default:
			break;
	}
}

- (void)toggleActivityView:(BOOL)isON
{
	if (!isON)
	{
		[activityView stopAnimating];
		arrowImage.hidden = NO;
	}
	else
	{
		[activityView startAnimating];
		arrowImage.hidden = YES;
		[self setStatus:kLoadingStatus];
	}
}

- (void)dealloc
{
	activityView = nil;
	statusLabel = nil;
	arrowImage = nil;
	lastUpdatedLabel = nil;
}

@end
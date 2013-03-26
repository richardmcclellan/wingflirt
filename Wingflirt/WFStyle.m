//
//  WFStyle.m
//  Wingflirt
//
//  Created by Richard McClellan on 3/20/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import "WFStyle.h"

@implementation WFStyle


+ (UIColor *)bgColor { return [UIColor colorWithHexString:@"E8E3DC"]; }
+ (UIColor *)elementColor { return [UIColor colorWithHexString:@"F9F8F6"]; }

+ (UIColor *)forecastLighterTintColor{ return RGB(230.0, 240.0, 255.0); }
+ (UIColor *)forecastLightTintColor { return RGB(26.0, 117.0, 187.0); }
+ (UIColor *)forecastSlightLightTintColor { return RGB(26.0, 95.0, 160.0); }
+ (UIColor *)tintColor { return RGB(30.0,94.0,134.0); }
+ (UIColor *)forecastSlightDarkTintColor { return RGB(24.0, 75.0, 125.0); }
+ (UIColor *)forecastDarkTintColor { return RGB(23.0, 64.0, 110.0); }

+ (UIColor *)forecastDarkBlueColor { return RGB(18.0, 113.0, 165.0); }
+ (UIColor *)forecastLightestGrayColor { return [UIColor whiteColor]; }
+ (UIColor *)forecastLighterGrayColor { return RGB(233, 233, 233); }
+ (UIColor *)forecastLightGrayColor { return RGB(214, 214, 214); }
+ (UIColor *)forecastSlightLightGrayColor { return RGB(150, 150, 150); }
+ (UIColor *)forecastGrayColor { return RGB(120, 120, 120); }
+ (UIColor *)forecastSlightDarkGrayColor { return RGB(56, 56, 56); }
+ (UIColor *)forecastDarkGrayColor { return RGB(33, 33, 33); }

+ (UIFont *)textViewFont { return [WFStyle boldFontOfSize:17.0]; }
+ (UIFont *)largeFont { return [WFStyle boldFontOfSize:15.0]; }
+ (UIFont *)smallFont { return [WFStyle fontOfSize:13.0]; }
+ (UIFont *)navigationFont { return [UIFont fontWithName:@"Gill Sans" size:17.0]; }
+ (UIFont *)boldFontOfSize:(CGFloat)size { return [UIFont fontWithName:@"Georgia" size:size]; }
+ (UIFont *)fontOfSize:(CGFloat)size { return [UIFont fontWithName:@"Georgia" size:size]; }

+ (UIView *)tableView:(UITableView *)tableView viewForSectionHeaderWithTitle:(NSString *)title {
    return [WFStyle tableView:tableView viewForSectionHeaderWithTitle:title color:NO];
}

+ (UIView *)tableView:(UITableView *)tableView viewForSectionHeaderWithTitle:(NSString *)title color:(BOOL)isColored {
    if(title && ![title isEqualToString:@""]) {
        UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.width,24)];
        [titleView setBackgroundColor:isColored ? [WFStyle forecastGrayColor] : [WFStyle forecastLightGrayColor]];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10,0,tableView.width - 10,24)];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setTextColor:isColored ? [WFStyle forecastLightestGrayColor] : [WFStyle forecastDarkGrayColor]];
        [label setFont:[WFStyle largeFont]];
        [label setText:title];
        [titleView addSubview:label];
        
        UIView *bottomDarkBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 23, tableView.width, 1)];
        [bottomDarkBorder setBackgroundColor:isColored ? [WFStyle forecastSlightDarkGrayColor] : [WFStyle forecastGrayColor]];
        [titleView addSubview:bottomDarkBorder];
        
        return titleView;
    }
    return nil;
}

+ (CGFloat)heightForSectionHeader {
    return 24;
}

+ (UIView *) defaultTitleView {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
	imageView.frame = CGRectMake(0, 0, 120, 30);
	return imageView;
}

+ (UIButton *) defaultTitleViewWithTarget:(id)target action:(SEL)action {
    UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [titleButton setFrame:CGRectMake(0, 0, 120, 30)];
    [titleButton setImage:[UIImage imageNamed:@"top_nav_bar_logo.png"] forState:UIControlStateNormal];
    [titleButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return titleButton;
}

+ (UIImage *)navigationBarBackgroundImage {
    UIGraphicsBeginImageContext(CGSizeMake(320, 44));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat locations[2] = { 0.0, 1.0 };
    CGColorSpaceRef myColorspace = CGColorSpaceCreateDeviceRGB();
    UIColor *c1 = [WFStyle forecastLightTintColor];
    UIColor *c2 = [WFStyle tintColor];
    CGFloat components[8] = { c1.red, c1.green, c1.blue, c1.alpha,
        c2.red, c2.green, c2.blue, c2.alpha, };
    CGGradientRef gradient = CGGradientCreateWithColorComponents(myColorspace, components, locations, 2);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0,44), 0);
    CGGradientRelease(gradient);
    UIImage *backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    if(kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iPhoneOS_5_0) {
        backgroundImage = [backgroundImage resizableImageWithCapInsets:UIEdgeInsetsZero];
    }
    CGColorSpaceRelease(myColorspace);
    UIGraphicsEndImageContext();
    return backgroundImage;
}

+ (UIBarButtonItem *)activityNavigationBarItem {
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicator.hidesWhenStopped = YES;
    [activityIndicator startAnimating];
    UIView *spinnerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    [spinnerView addSubview:activityIndicator];
    return [[UIBarButtonItem alloc] initWithCustomView:spinnerView];
}


@end

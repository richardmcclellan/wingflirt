//
//  WFStyle.h
//  Wingflirt
//
//  Created by Richard McClellan on 3/20/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define HSVA(h, s, v, a) [UIColor colorWithHue:h saturation:s brightness:v alpha:a]

@interface WFStyle : NSObject {
    
}

+ (UIColor *)bgColor;
+ (UIColor *)textColor;


+ (UIColor *)forecastLighterTintColor;
+ (UIColor *)forecastLightTintColor;
+ (UIColor *)forecastSlightLightTintColor;
+ (UIColor *)forecastTintColor;
+ (UIColor *)forecastSlightDarkTintColor;
+ (UIColor *)forecastDarkTintColor;

+ (UIColor *)forecastDarkBlueColor;
+ (UIColor *)forecastLightestGrayColor;
+ (UIColor *)forecastLighterGrayColor;
+ (UIColor *)forecastLightGrayColor;
+ (UIColor *)forecastSlightLightGrayColor;
+ (UIColor *)forecastGrayColor;
+ (UIColor *)forecastSlightDarkGrayColor;
+ (UIColor *)forecastDarkGrayColor;

+ (UIFont *)giantFont;
+ (UIFont *)largeFont;
+ (UIFont *)smallFont;
+ (UIFont *)boldForecastFontOfSize:(CGFloat)size;
+ (UIFont *)forecastFontOfSize:(CGFloat)size;

+ (UIView *)tableView:(UITableView *)tableView viewForSectionHeaderWithTitle:(NSString *)title;
+ (UIView *)tableView:(UITableView *)tableView viewForSectionHeaderWithTitle:(NSString *)title color:(BOOL)isColored;

+ (CGFloat)heightForSectionHeader;
+ (UIView *)defaultTitleView;
+ (UIButton *) defaultTitleViewWithTarget:(id)target action:(SEL)action;
+ (UIImage *)navigationBarBackgroundImage;
+ (UIBarButtonItem *)activityNavigationBarItem;


@end

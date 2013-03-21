//
//  NSDate-Additions.h
//  Hurricane
//
//  Created by Richard McClellan on 1/29/11.
//  Copyright 2011 Hurricane Party Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
//#define SECONDS_IN_DAY 86400 // 24 * 60 * 60

@interface NSDate (NSDate_Additions)

- (NSDate *) dateWithLocalDayComponent;
- (NSDate *) dateWithComponents:(NSUInteger)unitFlags forCalendar:(NSCalendar *)calendar;
- (NSString *) longDateTitleWithTimeZone:(NSTimeZone *)timeZone;
- (NSString *) mediumDateTitleWithTimeZone:(NSTimeZone *)timeZone;

- (NSDate *)dateFor8am;
- (BOOL) isBeforeDate:(NSDate *)date;
- (BOOL) isAfterDate:(NSDate *)date;

- (NSString *)dateTitleWithFormatter:(NSDateFormatter *)formatter;
- (NSDate *)dateWithoutSecondsComponent;
- (NSString *)timeAgoString;
- (NSDate *) ceilToMinuteStepSize:(NSInteger)minuteStepSize;

@end

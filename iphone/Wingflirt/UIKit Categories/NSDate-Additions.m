//
//  NSDate-Additions.m
//  Hurricane
//
//  Created by Richard McClellan on 1/29/11.
//  Copyright 2011 Hurricane Party Inc. All rights reserved.
//

#import "NSDate-Additions.h"

@interface NSDate (NSDate_Additions_Private)

@end

@implementation NSDate (NSDate_Additions)

- (NSDate *)dateWithLocalDayComponent {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setTimeZone:[NSTimeZone systemTimeZone]];
    return [self dateWithComponents:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit forCalendar:gregorian];
}

- (NSDate *)dateWithComponents:(NSUInteger)unitFlags forCalendar:(NSCalendar *)calendar {
    return [calendar dateFromComponents:[calendar components:unitFlags fromDate:self]];
}

- (NSString *)mediumDateTitleWithTimeZone:(NSTimeZone *)timeZone {
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"EEE, MMM d"];
    [formatter setTimeZone:timeZone];
	NSString *title = [self dateTitleWithFormatter:formatter];	
	return title;
}

- (NSString *)longDateTitleWithTimeZone:(NSTimeZone *)timeZone {
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:timeZone];
	[formatter setDateStyle:NSDateFormatterLongStyle];
	NSString *title = [self dateTitleWithFormatter:formatter];	
	return title;
}

- (NSString *)dateTitleWithFormatter:(NSDateFormatter *)formatter {
    NSCalendar * gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setTimeZone:[formatter timeZone]];
    NSDateComponents * components = [gregorian components:(NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:[NSDate date]];
    NSDate * today = [gregorian dateFromComponents:components];
    NSDateComponents *comp = [[NSDateComponents alloc] init];
    [comp setDay:-1];
    NSDate *todayMinusOne = [gregorian dateByAddingComponents:comp toDate:today options:0];
    [comp setDay:1];
    NSDate *tomorrow = [gregorian dateByAddingComponents:comp toDate:today options:0];
    NSDate *tomorrowPlusOne = [gregorian dateByAddingComponents:comp toDate:tomorrow options:0];
    NSString *day;
    if([self isBeforeDate:todayMinusOne]) {
        day = [formatter stringFromDate:self];
    } else if([self isBeforeDate:today]) {
        day = @"Yesterday";
    } else if([self isBeforeDate:tomorrow]) {
        day = @"Today";
    } else if([self isBeforeDate:tomorrowPlusOne]) {
        day = @"Tomorrow";
    } else {
        day = [formatter stringFromDate:self];
    }
    return day;
}

- (NSDate *)dateFor8am {
    NSCalendar * gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *todayComponents = [gregorian components:(NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit) fromDate:self];
    NSInteger todayHour = [todayComponents hour];
    [todayComponents setHour:8];
    NSDate *dateFor8am = [gregorian dateFromComponents:todayComponents];
    if(todayHour >= 8) {
        NSDateComponents *comp = [[NSDateComponents alloc] init];
        [comp setDay:1];
        dateFor8am = [gregorian dateByAddingComponents:comp toDate:dateFor8am options:0];
    }
    return dateFor8am;         
}

- (BOOL) isBeforeDate:(NSDate *)date {
	return ([self compare:date] == NSOrderedAscending);
}

- (BOOL) isAfterDate:(NSDate *)date {
	return ([self compare:date] == NSOrderedDescending);
}

- (NSDate *)dateWithoutSecondsComponent {
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSSecondCalendarUnit fromDate:self];
	return [self dateByAddingTimeInterval:-[comp second]];
}

- (NSDate *) ceilToMinuteStepSize:(NSInteger)minuteStepSize {
	NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:self];
	NSTimeInterval secondsToAdd = minuteStepSize*60 - (([comp minute] % minuteStepSize) * 60 + [comp second]);
	return [self dateByAddingTimeInterval:secondsToAdd];
}

-(NSString *)timeAgoString {
	NSInteger timeInterval = (NSInteger)(-[self timeIntervalSinceNow]);
	if(timeInterval <= 0) {
		// Sometimes the calculated interval will be negative because of small time differences
		// between our server and the time on someone's phone.  To avoid displaying "-25 seconds ago",
		// we will display "Just now"
		return @"Just now";
	}
	
	// Seconds
	if(timeInterval == 1) {
		return @"1 s ago";
	}
	if(timeInterval < 60) {
		return [NSString stringWithFormat:@"%d s ago", timeInterval];
	}
	// Minutes
	timeInterval /= 60.0;
	if(timeInterval == 1) {
		return @"1 min ago";
	}
	if(timeInterval < 60) {
		return [NSString stringWithFormat:@"%d min ago", timeInterval];
	}
	
	// Hours
	timeInterval /= 60.0;
	if(timeInterval == 1) {
		return @"1 hr ago";
	}
	if(timeInterval < 24) {
		return [NSString stringWithFormat:@"%d hrs ago", timeInterval];
	}
	
	// Days
	timeInterval /= 24.0;
	if(timeInterval == 1) {
		return @"1 day ago";
	}
	if(timeInterval < 365.0) {
		return [NSString stringWithFormat:@"%d days ago", timeInterval];
	}
	// Years
	timeInterval /= 365.0;
	if(timeInterval == 1) {
		return @"1 yr ago";
	}
	return [NSString stringWithFormat:@"%d yrs ago", timeInterval];
}


@end

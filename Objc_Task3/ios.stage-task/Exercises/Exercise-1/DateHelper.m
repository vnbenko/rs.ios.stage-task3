#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber > 0 && monthNumber <= 12) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        NSString *monthName = [[dateFormatter monthSymbols] objectAtIndex:monthNumber - 1];
        return monthName;
    }
    return nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    
    return [[NSCalendar currentCalendar] component:NSCalendarUnitDay
                                          fromDate:[dateFormatter dateFromString:date]];
    return 0;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    if (date != nil) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        NSLocale *locale = [NSLocale localeWithLocaleIdentifier:@"ru_RU"];
        dateFormatter.locale = locale;
        [dateFormatter setDateFormat: @"EE"];
        [dateFormatter setLocale:dateFormatter.locale];

        return [dateFormatter stringFromDate:date];
    }
    return nil;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
        NSInteger inputWeek = [calendar component:NSCalendarUnitWeekOfYear
                                         fromDate:date];
        NSInteger currentWeek = [calendar component:NSCalendarUnitWeekOfYear
                                           fromDate:[NSDate now]];
        
        return inputWeek == currentWeek ? YES : NO;
}

@end

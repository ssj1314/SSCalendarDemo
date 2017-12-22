//
//  NSDate+Additions.m
//  HTF_New
//
//  Created by lijinyang on 16/12/12.
//  Copyright © 2016年 htffund. All rights reserved.
//

#import "NSDate+Additions.h"

@implementation NSDate (Additions)
/**
 *  根据日期字符串 dateString 和格式 formatterString 得到日期对象
 *
 *  @param formatterString  日期格式类型
 *  @param dateString       日期数据
 *
 *  @return 根据日期字符串 dateString 和格式 formatterString 得到的日期对象
 */
+ (NSDate *)getDate:(NSString *)formatterString dateString:(NSString *)dateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterString];
    return [formatter dateFromString:dateString];
}

/**
 *  根据两个日期间的时间间隔得到间隔天数
 *
 *  @param time 两个日期间的时间间隔
 *
 *  @return 返回4.1天按照5天返回
 */
+ (int)getIntervalDays:(NSTimeInterval)time
{
    if (time < 0 && -time < 86400) {
        return -1;
    }
    return (time < 0) ? (floorf(time / 86400)) : (time / 86400);
}

+(NSDate *)dateFromDateString:(NSString *)aDateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy.MM.dd HH:mm:ss"];
    NSDate *date=[formatter dateFromString:aDateString];
    
    return date;
}

+(NSString *)stringFromDate:(NSDate *)date formatter:(NSString *)aFormatter
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:aFormatter];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    NSString * dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}

+ (int64_t)ConvertToSecondsFromDate:(NSDate *)date
{
    int64_t finalTime = [date timeIntervalSince1970];
    return finalTime;
}

+(NSString *)topCutdownTitleFromSeconds:(int64_t)seconds
{
    int64_t hour =seconds/3600;
    int64_t minute =(seconds-hour*3600)/60;
    int64_t seconds1 =seconds-hour*3600-minute*60;
    
//    NSDate *date=[NSDate dateWithTimeIntervalSince1970:seconds];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"HH:mm:ss"];
//    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    NSString * dateString =[NSString stringWithFormat:@"%@:%@:%@",
                            (hour>=10?[NSString stringWithFormat:@"%lld",hour]:[NSString stringWithFormat:@"0%lld",hour]),
                            (minute>=10?[NSString stringWithFormat:@"%lld",minute]:[NSString stringWithFormat:@"0%lld",minute]),
                            (seconds1>=10?[NSString stringWithFormat:@"%lld",seconds1]:[NSString stringWithFormat:@"0%lld",seconds1])];
    
    return dateString;
}

/**
 获取中国时区的当前时间
 */
+(NSDate*)dateChinaTimeZoneWithDate:(NSDate*)date
{
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    return localeDate;
}

NSDate * dateFromString(NSString *date,NSString *format)
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:date];
}

NSString * stringFromDate(NSDate *date,NSString *format)
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}
@end

//
//  NSDate+Additions.h
//  HTF_New
//
//  Created by lijinyang on 16/12/12.
//  Copyright © 2016年 htffund. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Additions)
+ (NSDate *)getDate:(NSString *)formatterString dateString:(NSString *)dateString;
+ (int)getIntervalDays:(NSTimeInterval)time;

/**
 根据字符串转日期
 */
+(NSDate *)dateFromDateString:(NSString *)aDateString;

/**
 根据日期转为字符串
 */
+(NSString *)stringFromDate:(NSDate *)date formatter:(NSString *)aFormatter;

/**
 将日期字符串转化成秒数
 */
+ (int64_t)ConvertToSecondsFromDate:(NSDate *)date;

/**
 高端推荐抢购倒计时文案
 */
+(NSString *)topCutdownTitleFromSeconds:(int64_t)seconds;

/**
 获取中国时区的当前时间
 */
+(NSDate*)dateChinaTimeZoneWithDate:(NSDate*)date;

NSDate * dateFromString(NSString *date,NSString *format);


NSString * stringFromDate(NSDate *date,NSString *format);

@end


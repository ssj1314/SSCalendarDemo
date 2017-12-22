//
//  BaseModel.h
//  HTF_New
//
//  Created by Revival_Road on 16/8/26.
//  Copyright © 2016年 htffund. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+YYModel.h"
/*处理统一的数据逻辑 包括初始化、数据归档、深浅复制等逻辑*/
@interface BaseModel : NSObject
+(void)saveData:(NSMutableArray *)data;
+(NSMutableArray *)readCachData;
+(void)clearCachData;
@end

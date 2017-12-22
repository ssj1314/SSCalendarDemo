//
//  ACEventModel.h
//  HTF_New
//
//  Created by sh-lx on 2017/12/6.
//Copyright © 2017年 htffund. All rights reserved.
//

#import "BaseModel.h"

@interface ACEventModel : BaseModel
@property(nonatomic ,copy)NSString *eventTitle;     //事件标题
@property(nonatomic ,copy)NSString *eventContent;   //事件内容
@property(nonatomic ,copy)NSString *eventType;      //事件类型
@end

//
//  ACEventListModel.h
//  HTF_New
//
//  Created by sh-lx on 2017/12/6.
//Copyright © 2017年 htffund. All rights reserved.
//

#import "BaseModel.h"
#import "ACEventModel.h"
@interface ACEventListModel : BaseModel
@property(nonatomic ,copy)NSString *eventDate;     //时间
@property(nonatomic ,copy)NSArray *eventInfoList;  //事件集合
@end

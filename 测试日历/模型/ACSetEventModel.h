//
//  ACSetEventModel.h
//  HTF_New
//
//  Created by sh-lx on 2017/12/6.
//Copyright © 2017年 htffund. All rights reserved.
//

#import "BaseModel.h"

@interface ACSetEventModel : BaseModel
@property(nonatomic ,copy)NSString *title;//标题
@property(nonatomic ,copy)NSString *rightTitle;//右标题
@property(nonatomic ,copy)NSString *jumpUrl;//跳转url
@property(nonatomic ,copy)NSString *iconUrl;//图片地址(url前缀 + 图片相对路径)
@end

//
//  ACEventListModel.m
//  HTF_New
//
//  Created by sh-lx on 2017/12/6.
//Copyright © 2017年 htffund. All rights reserved.
//

#import "ACEventListModel.h"

@implementation ACEventListModel

+(NSDictionary *)modelContainerPropertyGenericClass
{
    return @{@"eventInfoList":[ACEventModel class]};
}

@end

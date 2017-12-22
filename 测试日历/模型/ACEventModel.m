//
//  ACEventModel.m
//  HTF_New
//
//  Created by sh-lx on 2017/12/6.
//Copyright © 2017年 htffund. All rights reserved.
//

#import "ACEventModel.h"

@implementation ACEventModel

#pragma mark ---------- Life Cycle ----------
-(instancetype)init{
    self = [super init];
    if (self) {
        [self configurationModel];
    }
    return self;
}
#pragma mark ---------- Delegate ----------

#pragma mark ---------- Private Method ----------
#pragma mark 配置Model
-(void)configurationModel{}

#pragma mark ---------- Event Response ----------

#pragma mark ---------- Getters and Setters ----------

@end

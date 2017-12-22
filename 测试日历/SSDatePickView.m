//
//  SSDatePickView.m
//  测试日历
//
//  Created by htf on 2017/12/21.
//Copyright © 2017年 htf. All rights reserved.
//

#import "SSDatePickView.h"

@implementation SSDatePickView

#pragma mark ---------- Life Cycle ----------
-(instancetype)init{
    self = [super init];
    if (self) {
        [self resizeCustomView];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self resizeCustomView];
    }
    return self;
}
#pragma mark ---------- Delegate ----------

#pragma mark ---------- Private Method ----------
#pragma mark 调整自定义视图
-(void)resizeCustomView{}

#pragma mark ---------- Event Response ----------

#pragma mark ---------- Getters and Setters ----------

@end

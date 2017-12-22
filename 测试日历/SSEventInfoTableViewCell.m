//
//  SSEventInfoTableViewCell.m
//  测试日历
//
//  Created by htf on 2017/12/21.
//Copyright © 2017年 htf. All rights reserved.
//

#import "SSEventInfoTableViewCell.h"

@implementation SSEventInfoTableViewCell

#pragma mark ---------- Life Cycle ----------
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
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

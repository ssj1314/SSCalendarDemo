//
//  SSDayCell.m
//  测试日历
//
//  Created by htf on 2017/12/19.
//Copyright © 2017年 htf. All rights reserved.
//

#import "SSDayCell.h"

@implementation SSDayCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configurationView];
        [self resizeCustomView];
    }
    return self;
}

#pragma mark ---------- Methods ----------
#pragma mark 配置View
-(void)configurationView{}

#pragma mark 页面初始化
-(void)resizeCustomView{}

#pragma mark ---------- Click Event ----------

#pragma mark ---------- Delegate ----------

#pragma mark ---------- Lazy Load ----------

@end

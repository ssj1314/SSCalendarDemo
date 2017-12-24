//
//  ViewController.m
//  测试日历
//
//  Created by htf on 2017/12/15.
//  Copyright © 2017年 htf. All rights reserved.
//

#import "ViewController.h"
#import "SSCalendarView.h"
#import "SSMonthView.h"
#import "SSMonthHeadView.h"
#import "SSEventInfoTableViewCell.h"
#import "SSDayEventHeadrView.h"
#import "SSDayEventFooterView.h"
#import "SSDatePickView.h"
#import "SSCalendarbackgroundView.h"
#import "ACEventListModel.h"
#import "HooDatePicker/HooDatePicker.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate,HooDatePickerDelegate>
{
    SSDatePickView *_calendarPickerView;
    NSInteger _outOfDateIndex;
    BOOL _outOfDate;
}
//@property (nonatomic, strong) HooDatePicker *datePicker;
/* 日历 */
@property (nonatomic, strong) SSCalendarView *calendar;
/* 日历背景View */
@property (nonatomic ,strong)SSCalendarbackgroundView *calendarBackgroundView;
/* 日历tableView */
@property (nonatomic ,strong)UITableView *calendarTableView;
/* 年月View */
@property (nonatomic, strong) SSMonthHeadView *monthHeadView;
/* 设置Buton */
@property (nonatomic ,strong)UIButton *setupButon;
/* 事件数组 */
@property (nonatomic ,strong)NSMutableArray *eventInfos;
/* eventAPIManager */
//@property (nonatomic ,strong)ACEventAPIManager *eventAPIManager;
/* 时间转换 */
@property (nonatomic ,strong)NSDateFormatter *dateFormatter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /* 年月View */
    [self.monthHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.top.equalTo(self.view.mas_top).offset(10);
        make.height.mas_equalTo(50);
    }];
    /* 日历tableView */
    [self.calendarTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(60, 0, 60+0, 0));
    }];
    //     设置Buton
    [self.setupButon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.calendarTableView.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.mas_equalTo(50);
    }];
    self.eventInfos = [NSMutableArray array];
}
#pragma mark -API --网络就不写了
#pragma mark 请求date的月份
-(void)loadRequestEventListsWithDate:(NSDate*)date
{
//    /* 时区转换 */
//    NSDate *firstDay = [NSDate dateChinaTimeZoneWithDate:[[ACDateHelpObject manager] GetFirstDayOfMonth:date]];
//    NSDate *lastDay = [NSDate dateChinaTimeZoneWithDate:[[ACDateHelpObject manager] getEarlyOrLaterDate:[[ACDateHelpObject manager] getNextMonth:firstDay] LeadTime:-1 Type:2]];
//    /* 参数设置 */
//    [self.dateFormatter setDateFormat:@"yyyyMMdd"];
//    NSMutableDictionary *parameterDic = [[NSMutableDictionary alloc] init];
//    [parameterDic setObject:[self.dateFormatter stringFromDate:firstDay] forKey:@"startDate"];
//    [parameterDic setObject:[self.dateFormatter stringFromDate:lastDay] forKey:@"endDate"];
//    NSLog(@"\nstartDate ----- %@\n  endDate ----- %@",firstDay,lastDay);
//    [self.eventAPIManager setParameterDic:parameterDic];
//    WS(weakSelf);
//    [self.eventAPIManager setSuccussCallbackBlock:^(NSDictionary *result) {
//        weakSelf.eventInfos = result[@"calendarEventList"];
//        weakSelf.calendar.currentMonthView.noTradeDayArray = result[@"noTradeDayList"];
//        weakSelf.calendar.currentMonthView.eventArray = result[@"calendarEventList"];
//    }];
//    [self.eventAPIManager loadData];
}
#pragma mark UITableViewDelegate & UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.eventInfos.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ACEventListModel *eventListModel = self.eventInfos[section];
    return eventListModel.eventInfoList.count;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == _outOfDateIndex)
    {
        if (_outOfDate) {
            return CGFLOAT_MIN;
        }
        return 40;
    }
    return CGFLOAT_MIN;;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *headerFooterIdentifier = @"HeaderView";
    SSDayEventHeadrView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterIdentifier];
    if (!headerView)
    {
        headerView = [[SSDayEventHeadrView alloc] initWithReuseIdentifier:headerFooterIdentifier];
    }
    /* 标题 */
    ACEventListModel *eventListModel = [_eventInfos AX_objectAtIndex:section];
    [self.dateFormatter setDateFormat:@"yyyyMMdd"];
    NSDate *dayDate = [self.dateFormatter dateFromString:eventListModel.eventDate];
    [self.dateFormatter setDateFormat:@"MM月dd日"];
    headerView.dayLabel.text = [self.dateFormatter stringFromDate:dayDate];
    
    /* 选中日期 */
    [self.dateFormatter setDateFormat:@"yyyyMMdd"];
    if ([[self.dateFormatter stringFromDate:self.calendar.currentMonthView.selectDate] isEqualToString:eventListModel.eventDate])
    {
        /* 今天 */
        if ([[SSDateHelpObject manager] isSameDate:self.calendar.currentMonthView.selectDate AnotherDate:[NSDate dateChinaTimeZoneWithDate:[NSDate date]]])
        {
            headerView.dayLabel.textColor = UIColorWithHex(0xffffff);
            headerView.eventTitleBackgroundImageView.image =[UIImage imageNamed:@"ic_ac_event_red_background"];
        }
        else
        {
            headerView.dayLabel.textColor = UIColorWithHex(0xfb5c5f);
            headerView.eventTitleBackgroundImageView.image =[UIImage imageNamed:@"ic_ac_event_red_circle"];
        }
    }
    else
    {
        /* 过期样式调整 */
        if (section > _outOfDateIndex)
        {
            headerView.dayLabel.textColor = UIColorWithHex(0x999999);
            headerView.eventTitleBackgroundImageView.image =[UIImage imageNamed:@"ic_ac_gray_background"];
        }
        else
        {
            headerView.dayLabel.textColor = UIColorWithHex(0x000000);
            headerView.eventTitleBackgroundImageView.image =[UIImage imageNamed:@"ic_ac_gray_circle"];
        }
    }
    
    /* 过期样式调整 */
    if (section > _outOfDateIndex)
    {
        headerView.contentView.backgroundColor = UIColorWithHex(0xeeeeee);
        if (section == _outOfDateIndex+1) {
            headerView.lineView.backgroundColor = kViewBgGrayColor;
        }
        else
        {
            headerView.lineView.backgroundColor = UIColorFromRGBA(96, 96, 96, 0.1);
        }
    }
    else
    {
        headerView.contentView.backgroundColor = [UIColor whiteColor];
        headerView.lineView.backgroundColor = kViewBgGrayColor;
    }
    return headerView;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    static NSString *headerFooterIdentifier = @"FooterView";
    SSDayEventFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterIdentifier];
    if (!footerView)
    {
        footerView = [[SSDayEventFooterView alloc] initWithReuseIdentifier:headerFooterIdentifier];
        footerView.contentView.backgroundColor = kViewBgGrayColor;
    }
    if (section != _outOfDateIndex) {
        footerView.promptLabel.hidden = YES;
    }
    else
    {
        if (_outOfDate)
        {
            footerView.promptLabel.hidden = YES;
        }
        else
        {
            footerView.promptLabel.hidden = NO;
        }
        
    }
    return footerView;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"EventInfoCell";
    SSEventInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[SSEventInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    ACEventListModel *eventListModel = [_eventInfos AX_objectAtIndex:indexPath.section];
    ACEventModel *eventModel = [eventListModel.eventInfoList AX_objectAtIndex:indexPath.row];
    cell.eventTitleLable.text = eventModel.eventTitle;
    cell.eventContentLable.text = eventModel.eventContent;
    
    if (indexPath.section > _outOfDateIndex) {
        /* 过期 */
        cell.backgroundColor = UIColorWithHex(0xeeeeee);
        /* 隐藏分割线 */
        if (eventListModel.eventInfoList.count-1 == indexPath.row) {
            cell.lineView.backgroundColor = cell.backgroundColor;
        }
        else
        {
            cell.lineView.backgroundColor = UIColorFromRGBA(96, 96, 96, 0.1);
        }
    }
    else
    {
        /* 没过期 */
        cell.backgroundColor = [UIColor whiteColor];
        /* 隐藏分割线 */
        if (eventListModel.eventInfoList.count-1 == indexPath.row) {
            cell.lineView.backgroundColor = cell.backgroundColor;
        }
        else
        {
            cell.lineView.backgroundColor = kViewBgGrayColor;
        }
    }
    
    
    return cell;
}
-(void)leftSelectDateButtonClick:(UIButton*)sender
{
    [self.calendar changeMonthView:[[SSDateHelpObject manager] getPreviousMonth:self.calendar.currentMonthView.currentDate]];
}

-(void)rightSelectDateButtonClick:(UIButton*)sender
{
    [self.calendar changeMonthView:[[SSDateHelpObject manager] getNextMonth:self.calendar.currentMonthView.currentDate]];
}
#pragma mark -getters and setters
-(UITableView *)calendarTableView
{
    if (!_calendarTableView) {
        _calendarTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _calendarTableView.dataSource = self;
        _calendarTableView.delegate = self;
        _calendarTableView.rowHeight = UITableViewAutomaticDimension;
        _calendarTableView.estimatedRowHeight = 100;//期望高度
        _calendarTableView.backgroundColor = kViewBgGrayColor;
        _calendarTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        /* headerView */
        [self.calendarBackgroundView setFrame:CGRectMake(0, 0, self.calendar.width, self.calendar.height+60)];
        [self.calendarBackgroundView addSubview:self.calendar];
        _calendarTableView.tableHeaderView = self.calendarBackgroundView;
        _calendarTableView.tableFooterView = [[UIView alloc] init];
        [self.view addSubview:_calendarTableView];
    }
    return _calendarTableView;
}

-(void)yearMonthClick:(UITapGestureRecognizer*)gesture
{
    if (!_calendarPickerView) {
        _calendarPickerView = [[SSDatePickView alloc] initWithFrame:CGRectMake(0, kScreenHeight-260, kScreenWidth, 260)];
        __weak typeof(self) weakSelf = self;
        
        _calendarPickerView.selectDate = ^(NSDate *selDate) {
            [weakSelf.calendar changeMonthView:selDate];
        };
    }
    [_calendarPickerView.datePicker show];
    [self.view addSubview:_calendarPickerView];
}

-(SSMonthHeadView *)monthHeadView
{
    if(!_monthHeadView){
        _monthHeadView = [[SSMonthHeadView alloc] initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, 40)];
        UITapGestureRecognizer *tapgest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(yearMonthClick:)];
        tapgest.delegate = self;
        [_monthHeadView.yearMonthLabel addGestureRecognizer:tapgest];
        [_monthHeadView.leftButton addTarget:self action:@selector(leftSelectDateButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_monthHeadView.rightButton addTarget:self action:@selector(rightSelectDateButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_monthHeadView];
    }
    return _monthHeadView;
}

-(UIButton *)setupButon
{
    if (!_setupButon)
    {
        _setupButon = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setBackgroundColor:[UIColor whiteColor]];
            [button.titleLabel setFont:[UIFont systemFontOfSize:17.f]];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [button setTitle:@"个人事项设置" forState:UIControlStateNormal];
//            [button addSubview:redSeparateLine(CGRectMake(0, 0, kScreenWidth, 1))];
            button;
        });

//        [_setupButon addTarget:self action:@selector(setupButonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_setupButon];
    }

    return _setupButon;
}

-(void)setEventInfos:(NSMutableArray *)eventInfos
{
    _outOfDateIndex = -1;
    
    [self.dateFormatter setDateFormat:@"yyyy-MM"];
    NSString *currnetDate = [self.dateFormatter stringFromDate:[NSDate dateChinaTimeZoneWithDate:[NSDate date]]];
    
    NSMutableArray *dayArray = [[NSMutableArray alloc] init];
    NSMutableArray *outOfDateArray = [[NSMutableArray alloc] init];
    for (int i=0; i<eventInfos.count; i++)
    {
        ACEventListModel *eventListModel = eventInfos[i];
        /* 过期分组 */
        NSInteger compare = [[SSDateHelpObject manager] compareDate:currnetDate withDate:eventListModel.eventDate];
        if (compare == NSOrderedAscending||compare == NSOrderedSame) {
            [dayArray addObject:eventListModel];
            _outOfDateIndex ++;
        }
        else
        {
            [outOfDateArray addObject:eventListModel];
        }
    }
    
    /* 数据合并 */
    if (_eventInfos) {
        [_eventInfos removeAllObjects];
    }
    else
    {
        _eventInfos = [[NSMutableArray alloc] init];
    }
    
    [_eventInfos addObjectsFromArray:dayArray];
    [_eventInfos addObjectsFromArray:outOfDateArray];
    if (_outOfDateIndex == -1)
    {
        if (_eventInfos.count == 0) {
            self.calendarBackgroundView.promptViewStyle = SSPromptViewStyleNOEvent;
        }
        else
        {
            self.calendarBackgroundView.promptViewStyle = SSPromptViewStyleOutOfDate;
        }
        [self.calendarBackgroundView setFrame:CGRectMake(0, 0, self.calendar.width, self.calendar.height+60)];
    }
    else
    {
        self.calendarBackgroundView.promptViewStyle = SSPromptViewStyleLine;
        [self.calendarBackgroundView setFrame:CGRectMake(0, 0, self.calendar.width, self.calendar.height+20)];
    }
    
    if (outOfDateArray.count <=0)
    {
        _outOfDate = YES;
    }
    else
    {
        _outOfDate = NO;
    }
    [self.calendarTableView reloadData];
}

-(SSCalendarView *)calendar
{
    if (!_calendar)
    {
        /* _calendar */
        _calendar = [[SSCalendarView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [SSCalendarView getMonthTotalHeight:[NSDate dateChinaTimeZoneWithDate:[NSDate date]]]) Date:[NSDate dateChinaTimeZoneWithDate:[NSDate date]]];
        __weak typeof(self) weakSelf = self;
        
        /* 改变选中 */
        _calendar.sendSelectDate = ^(NSDate *selDate)
        {
            [weakSelf.dateFormatter setDateFormat:@"yyyyMMdd"];
            [weakSelf.calendarTableView reloadData];
            for (int i=0; i<weakSelf.eventInfos.count; i++) {
                ACEventListModel *eventListModel = weakSelf.eventInfos[i];
                NSString *selStr = [weakSelf.dateFormatter stringFromDate:selDate];
                if ([selStr isEqualToString:eventListModel.eventDate])
                {
                    weakSelf.calendarTableView.contentOffset = CGPointMake(0, 0);
                    /* 定位事件位置 */
                    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:i];
                    [weakSelf.calendarTableView scrollToRowAtIndexPath:scrollIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
                }
            }
        };
        /* 刷新高度 */
        _calendar.refreshH = ^(CGFloat viewH)
        {
            weakSelf.calendar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, viewH);
            weakSelf.calendarBackgroundView.promptViewStyle = SSPromptViewStyleLine;
            [weakSelf.calendarBackgroundView setFrame:CGRectMake(0, 0, weakSelf.calendar.width, weakSelf.calendar.height+20)];
            
            weakSelf.monthHeadView.yearMonthLabel.text = [[SSDateHelpObject manager] getStrFromDateFormat:@"yyyy年MM月" Date:weakSelf.calendar.currentMonthView.currentDate];
            [weakSelf loadRequestEventListsWithDate:[NSDate dateChinaTimeZoneWithDate:weakSelf.calendar.currentMonthView.currentDate]];
        };
        /* 当前选择月份 */
        weakSelf.monthHeadView.yearMonthLabel.text = [[SSDateHelpObject manager] getStrFromDateFormat:@"yyyy年MM月" Date:[NSDate dateChinaTimeZoneWithDate:[NSDate date]]];
    }
    return _calendar;
}

-(SSCalendarbackgroundView *)calendarBackgroundView
{
    if (!_calendarBackgroundView) {
        _calendarBackgroundView = [[SSCalendarbackgroundView alloc] init];
        /* lineView */
        _calendarBackgroundView.promptViewStyle = SSPromptViewStyleLine;
    }
    return _calendarBackgroundView;
}

//-(ACEventAPIManager *)eventAPIManager
//{
//    if (!_eventAPIManager) {
//        _eventAPIManager = [[ACEventAPIManager alloc] init];
//        _eventAPIManager.ac = ACalendar_EventList_Select;
//    }
//    return _eventAPIManager;
//}

-(NSDateFormatter *)dateFormatter
{
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
        [_dateFormatter setTimeZone:timeZone];
    }
    return _dateFormatter;
}

@end

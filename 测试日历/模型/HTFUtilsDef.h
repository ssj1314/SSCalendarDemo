//
//  Config.h
//  HTF_New
//
//  Created by Revival_Road on 16/8/26.
//  Copyright © 2016年 htffund. All rights reserved.
//

#ifndef Config_h
#define Config_h

//-------------------尺寸、版本、语言-------------------------
#define kNavBarHeight 44
#define kTabBarHeight 49
#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
#define kNoVisibleHeight (kNavBarHeight+kTabBarHeight+kStatusBarHeight)
#define kTopBarHeight (kNavBarHeight+kStatusBarHeight)
#define kBottomDangerousAreaHeight ([[AXMobileParameter iPhoneVersion] isEqualToString:@"iPhone X"]?34:0)//iphoneX引入，底部危险区域
#define kLeftOffset 15
#define kScreenScaleLeftOffset [UIScreen mainScreen].scale/2.0*15
#define kRightOffset 10
#define kButtonHeight 44
#define KButtonOffsetY 30
#define KBottomButtonOffsetY 25
#define kNormalControlHeight 50
#define kNormalCellHeight 50
#define HSpace_To_RootViewEdge 15

#define kPwdMinLength 6
#define kPwdMaxLength 14

#define KProportionWidth [UIScreen mainScreen].bounds.size.width/375.0 //设备相对于IPhone6宽的比例
#define KProportionHeight [UIScreen mainScreen].bounds.size.height/667.0 //设备相对于IPhone6高的比例

/*********************************特殊设备型号判断***********************************/
#define isIphoneX ([[AXMobileParameter iPhoneVersion] isEqualToString:@"iPhone X"]?YES:NO)
/*********************************************************************************/

//-------------------动画时间-------------------------
#define kAnimationDuration 0.25

//-------------------tableview相关-------------------------
#define kTableCellContentOffset 15
#define kStandardLeftOffset 15
#define kTableSectionMargin     15
#define kTableLeftPadding       12.5
#define kTableRightPadding      12.5
#define kTableSectionDivide     10
#define kCellHeight     50

#define kScreenWidth     [UIScreen mainScreen].bounds.size.width
#define kScreenWidth_6 375
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height
#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

#define kTableHeaderHeight 10.f

#define IOS_VERSION    [UIDevice currentDevice].systemVersion.floatValue
#define iOS7_OR_LATER  [UIDevice currentDevice].systemVersion.floatValue>=7.0
#define iOS8_OR_LATER  [UIDevice currentDevice].systemVersion.floatValue>=8.0
#define iOS9_OR_LATER  [UIDevice currentDevice].systemVersion.floatValue>=9.0
#define SYSTEM_VERSION_EQUAL_TO(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] ==NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)             ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] ==NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] !=NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] ==NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] !=NSOrderedDescending)
//手机型号
#define IPHONE6_OR_LATER [UIScreen mainScreen].bounds.size.width>=375
//-----------------------数据校验---------------------------
#define VALIDSTRING(string) [string isKindOfClass:[NSString class]]&&string.length>0&&string!=nil
#define VALIDARRAY(array)   [array isKindOfClass:[NSArray class]]&&array!=nil
#define VALIDDICTIONARY(dic) [dic isKindOfClass:[NSDictionary class]]&&dic!=nil

//#define ARRAY(array) ((NSArray *)array)
//#define DICTIONARY(dic) ((NSDictionary *)dic)
//
//#define ARRAY_KIND_CLASS(array) [array isKindOfClass:[NSArray class]]
//#define DICTIONARY_KIND_CLASS(dic) [dic isKindOfClass:[NSDictionary class]]

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
//-----------------------打印日志---------------------------
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

//DEBUG  模式下打印日志,当前行 并弹出一个警告
#ifdef DEBUG
#   define ULog(fmt, ...)  { UIAlertView *alert =[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define ULog(...)
#endif

//-------------------图片--------------------------
#define LOADIMAGE(name,type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]
#define IMAGE(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]
#define IMAGENAMED(name) [UIImage imageNamed:name]

//-------------------tag取view--------------------------
#define ViewWithTag(view,tag)  [view viewWithTag:tag]
//-------------------GCD--------------------------
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)


//------------------取缓存
#define AppUserInfo ((MyUserInfo *)((AppDelegate *)[UIApplication sharedApplication].delegate).userInfo)

//-------------------------------colors--------------------------------------
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define	UIColorFromRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0  \
blue:b/255.0 alpha:1.0]
#define	UIColorFromRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0  \
blue:b/255.0 alpha:a]
#define UIColorWithHex(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((hexValue & 0xFF00) >> 8))/255.0 \
blue:((float)(hexValue & 0xFF))/255.0 alpha:1]

#define colorWithHex(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0\
green:((float)((hexValue & 0xFF00) >> 8))/255.0\
blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue]

#define colorWithHexWithAlpha(hexValue,alphaValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue]

//加载动画
#define  STOP_API_LOADING(aView) if([aView isKindOfClass:[UIScrollView class]])\
{\
[aView.pullToRefreshView stopAnimating];\
[aView.infiniteScrollingView stopAnimating];\
}

//app代理
#define  kApp ((AppDelegate *)[UIApplication sharedApplication].delegate)
//缺省图片
#define kNoDataImageName @"ic_no_data_logo"
#define  kNoDataText @"暂无数据"

#define fequal(a,b) (fabsf((a) - (b)) < FLT_EPSILON)  //判断两个float是否相等
#define fequalzero(a) (fabsf(a) < FLT_EPSILON)        //判断float数字是否为0
#define dequal(a,b) (fabs((a) - (b)) < DBL_EPSILON)  //判断两个double是否相等
#define dequalzero(a) (fabs(a) < DBL_EPSILON)        //判断double数字是否为0

#define RequestReturnOK(dictInfo)   (dictInfo&&dictInfo != nil && ([[(dictInfo) objectForKey:@"returnCode"] intValue] == 0))
#endif /* Config_h */

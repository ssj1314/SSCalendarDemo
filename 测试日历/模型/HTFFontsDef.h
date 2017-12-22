//
//  HTFFontsDef.h
//  HTF_New
//
//  Created by lijinyang on 16/9/21.
//  Copyright © 2016年 htffund. All rights reserved.
//

#ifndef HTFFontsDef_h
#define HTFFontsDef_h

#define SysFontOfSize(fontSize) [UIFont systemFontOfSize:fontSize]
#define BoldSysFontOfSize(fontSize) [UIFont boldSystemFontOfSize:fontSize]

#define kScaleRatio [UIScreen mainScreen].scale/2.0

#pragma mark - ************************************** font size **************************************
#define DEFAULT_FONT_SIZE     ((IPHONE6_OR_LATER) ? 16 : 14)
#define PICKER_FONT           ((IPHONE6_OR_LATER) ? 18 : 16)
#define FOND_INFO_FONT        ((IPHONE6_OR_LATER) ? 16 : 14)
#define USERINFO_LABEL_FONT   ((IPHONE6_OR_LATER) ? 14 : 12)
#define USERINFO_LOGIN_FONT   ((IPHONE6_OR_LATER) ? 12 : 10)
#define FINANCIAL_MIN_FONT    ((IPHONE6_OR_LATER) ? 11 :  8)
#define USERINFO_NAME_FONT    ((IPHONE6_OR_LATER) ? 20 : 18)
#define YIELDDATA_FONT_SIZE   ((IPHONE6_OR_LATER) ? 22 : 20)
#define TOTALASSET_FONT_SIZE  ((IPHONE6_OR_LATER) ? 30 : 22)
#define LASTYIELD_FONT_SIZE   ((IPHONE6_OR_LATER) ? 11 :  9)
#define TITLEBAR_BUTTON_SIZE  ((IPHONE6_OR_LATER) ? 16 :  14)
#define BUTTON_FONTSIZE       USERINFO_NAME_FONT


#pragma mark - ************************************** font names **************************************
#define DEFAULT_FONT             @"Helvetica Neue"
#define NUMBER_FONT              @"AppleSDGothicNeo-Light"
#define BOLD_DEFAULT_FONT        @"HelveticaNeue-Bold"
#define NAVIGATION_TITLE         @"Copperplate-Bold"


//新增字体
#define STFontWithSize(fontSize)   [UIFont fontWithName:@"STheiti" size:fontSize]//适用情况：
#define HNFontWithSize(fontSize)   [UIFont fontWithName:@"Helvetica Neue" size:fontSize]//适用情况:数字
#define HNBoldFontWithSize(fontSize) [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:fontSize]
#define PFFontWithSize(fontSize)   [UIDevice currentDevice].systemVersion.floatValue<=9.0?[UIFont systemFontOfSize:fontSize]:[UIFont fontWithName:@"PingFangSC-Thin" size:fontSize]//适用情况：苹方细体
#define PFMediumFontWithSize(fontSize)   [UIDevice currentDevice].systemVersion.floatValue<9.0?[UIFont systemFontOfSize:fontSize]:[UIFont fontWithName:@"PingFangSC-Regular" size:fontSize]//适用情况：苹方常规
#define PFBoldFontWithSize(fontSize)   [UIDevice currentDevice].systemVersion.floatValue<9.0?[UIFont boldSystemFontOfSize:fontSize]:[UIFont fontWithName:@"PingFangSC-Semibold" size:fontSize]//适用情况：苹方粗体

//新增字体大小
//#define Big_Font_Size  kScreenWidth>kScreenWidth_6?18:(kScreenWidth==kScreenWidth_6?17:16)
//#define Default_Font_Size kScreenWidth>kScreenWidth_6?16:(kScreenWidth==kScreenWidth_6?15:14)
//#define Small_Font_Size kScreenWidth>kScreenWidth_6?14:(kScreenWidth==kScreenWidth_6?13:12)
//#define Max_Small_Font_Size kScreenWidth>kScreenWidth_6?12:(kScreenWidth==kScreenWidth_6?11:10)
//
//#define _16px kScreenWidth>kScreenWidth_6?10:(kScreenWidth==kScreenWidth_6?9:8)
//#define _18px kScreenWidth>kScreenWidth_6?11:(kScreenWidth==kScreenWidth_6?10:9)
//#define _20px kScreenWidth>kScreenWidth_6?12:(kScreenWidth==kScreenWidth_6?11:10)
//#define _22px kScreenWidth>kScreenWidth_6?13:(kScreenWidth==kScreenWidth_6?12:11)
//#define _24px kScreenWidth>kScreenWidth_6?14:(kScreenWidth==kScreenWidth_6?13:12)
//#define _26px kScreenWidth>kScreenWidth_6?15:(kScreenWidth==kScreenWidth_6?14:13)
//#define _28px kScreenWidth>kScreenWidth_6?16:(kScreenWidth==kScreenWidth_6?15:14)
//#define _30px kScreenWidth>kScreenWidth_6?17:(kScreenWidth==kScreenWidth_6?16:15)
//#define _32px kScreenWidth>kScreenWidth_6?18:(kScreenWidth==kScreenWidth_6?17:16)
//#define _34px kScreenWidth>kScreenWidth_6?19:(kScreenWidth==kScreenWidth_6?18:17)
//#define _36px kScreenWidth>kScreenWidth_6?20:(kScreenWidth==kScreenWidth_6?19:18)
//#define _39px kScreenWidth>kScreenWidth_6?21.5:(kScreenWidth==kScreenWidth_6?20.5:19.5)
//#define _40px kScreenWidth>kScreenWidth_6?22:(kScreenWidth==kScreenWidth_6?21:20)
//#define _44px kScreenWidth>kScreenWidth_6?24:(kScreenWidth==kScreenWidth_6?23:22)
//#define _66px kScreenWidth>kScreenWidth_6?35:(kScreenWidth==kScreenWidth_6?34:33)
//#define _70px kScreenWidth>kScreenWidth_6?37:(kScreenWidth==kScreenWidth_6?36:35)

#define Big_Font_Size  16
#define Default_Font_Size 14
#define Small_Font_Size 12
#define Max_Small_Font_Size 10

#define _16px 8
#define _18px 9
#define _20px 10
#define _22px 11
#define _24px 12
#define _26px 13
#define _28px 14
#define _30px 15
#define _32px 16
#define _34px 17
#define _36px 18
#define _39px 19.5
#define _40px 20
#define _44px 22
#define _46px 23
#define _48px 24
#define _50px 25
#define _60px 30
#define _66px 33
#define _70px 35
#define _80px 40
#endif /* HTFFontsDef_h */

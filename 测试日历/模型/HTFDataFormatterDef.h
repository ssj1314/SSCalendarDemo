//
//  HTFDataFormatterDef.h
//  HTF_New
//
//  Created by lijinyang on 16/11/15.
//  Copyright © 2016年 htffund. All rights reserved.
//

#ifndef HTFDataFormatterDef_h
#define HTFDataFormatterDef_h

//text filter
#define RegexVerificationCode  @"\\d{6}"
#define RegexMobileNumber      @"1\\d{10}"
#define RegexPositiveFloat     @"^\\d+(\\.\\d+)?$"
#define RegexUserCertNum       @"(\\d{18}$|^\\d{17}(\\d|X|x))$"
#define RegexNum               @"\\d"
#define RegexMoney             @"^[0-9]+(\\.[0-9]{0,999})?$"
#define RegexMail @"^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$"

#define DateFormatStandard     @"yyyy-MM-dd"
#define DateFormatNav          @"MM-dd"
#define dateFormatNor          @"yyyyMMdd"
#define DateFormatDetail       @"yyyy-MM-dd HH:mm:ss"

#define fequal(a,b) (fabsf((a) - (b)) < FLT_EPSILON)  //判断两个float是否相等
#define fequalzero(a) (fabsf(a) < FLT_EPSILON)        //判断float数字是否为0
#define dequal(a,b) (fabs((a) - (b)) < DBL_EPSILON)  //判断两个double是否相等
#define dequalzero(a) (fabs(a) < DBL_EPSILON)        //判断double数字是否为0


#endif /* HTFDataFormatterDef_h */

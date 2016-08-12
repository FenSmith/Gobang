//
//  Macro.h
//  Gobang
//
//  Created by tangwei on 16/8/12.
//  Copyright © 2016年 tangwei. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

// 当前屏幕 width
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

// 当前屏幕 height
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

//十六进制颜色,如UI标志 #ffa748,使用方式UIColorFromHex(0xffa748),将#替换为0x
#define UIColorFromHex(HexColor) [UIColor colorWithRed:((float)((HexColor & 0xFF0000) >> 16))/255.0 green:((float)((HexColor & 0xFF00) >> 8))/255.0 blue:((float)(HexColor & 0xFF))/255.0 alpha:1.0]
#define UIColorFromHexA(HexColor,A) [UIColor colorWithRed:((float)((HexColor & 0xFF0000) >> 16))/255.0 green:((float)((HexColor & 0xFF00) >> 8))/255.0 blue:((float)(HexColor & 0xFF))/255.0 alpha:A]

//十进制颜色
#define UIColorFromRGBA(R,G,B,A) [UIColor colorWithRed:(R/255.0) green:(G/255.0) blue:(B/255.0) alpha:A]
#define UIColorFromRGB(R,G,B) [UIColor colorWithRed:(R/255.0) green:(G/255.0) blue:(B/255.0) alpha:1.0]



/*调试模式日志输出*/
//打印日志,输出当前行
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

//DEBUG  模式下打印日志,当前行 并弹出一个警告
#ifdef DEBUG
#   define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc]\
initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] essage:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define ULog(...)
#endif

#endif /* Macro_h */

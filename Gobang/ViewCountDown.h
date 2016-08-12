//
//  ViewCountDown.h
//  Gobang
//
//  Created by tangwei on 16/8/12.
//  Copyright © 2016年 tangwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewCountDown : UIView

//view背景色
@property (nonatomic) UIColor *custBackgroundColor;

//线初始颜色
@property (nonatomic) UIColor *lineColor;

//线显示数字变化颜色
@property (nonatomic) UIColor *lineLightColor;

- (void) updateTime:(NSInteger) time;

@end

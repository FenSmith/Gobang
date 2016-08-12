//
//  ViewCountDown.m
//  Gobang
//
//  Created by tangwei on 16/8/12.
//  Copyright © 2016年 tangwei. All rights reserved.
//

#import "ViewCountDown.h"

static const NSInteger numberWidth = 55;   //数字框的宽
static const NSInteger numberHeight = 65;  //数字框的高
static const NSInteger centerWith = 5;     //数字之间间隔
static const NSInteger numberCount = 2;    //数字个数
static const float lineWidth = 3;          //数字线宽度

@interface ViewCountDown ()

@property (nonatomic)   UIView    *line1;
@property (nonatomic)   UIView    *line2;
@property (nonatomic)   UIView    *line3;
@property (nonatomic)   UIView    *line4;
@property (nonatomic)   UIView    *line5;
@property (nonatomic)   UIView    *line6;
@property (nonatomic)   UIView    *line7;
@property (nonatomic)   UIView    *line8;
@property (nonatomic)   UIView    *line9;
@property (nonatomic)   UIView    *line10;
@property (nonatomic)   UIView    *line11;
@property (nonatomic)   UIView    *line12;

@end

@implementation ViewCountDown

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setFrame:frame];
        
        if ( self.custBackgroundColor == nil ) {
            self.custBackgroundColor = [UIColor clearColor];
        }
        
        if ( self.lineColor == nil ) {
            self.lineColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:0.8];
        }
        
        if ( self.lineLightColor == nil ) {
            self.lineLightColor = [UIColor orangeColor];//[UIColor colorWithRed:248/255.0 green:113/255.0 blue:55/255.0 alpha:1];
        }
    }
    return self;
}

- (void)setFrame:(CGRect)frame{
    
    CGSize size = frame.size;
    float width = size.width;
    float height = size.height;
    
    if ( size.width < numberCount * numberWidth + centerWith ) {
        width = numberCount * numberWidth + centerWith;
    }
    
    if ( size.height < numberHeight ) {
        height = numberHeight;
    }
    
    [super setFrame:CGRectMake(frame.origin.x, frame.origin.y, width, height)];
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //初始化设置
        [self setUp];
    });
}

- (void) setUp{
    
    self.backgroundColor = self.custBackgroundColor;
    
    float left_w = (self.frame.size.width - numberCount * numberWidth - centerWith) / 2;
    float top_w = (self.frame.size.height - numberHeight) / 2;
    float left_center_w = (numberWidth - 3 * lineWidth) / 2;
    float top_center_w = (numberHeight - 3 * lineWidth) / 2;
    
    //第一个数字的竖线
    self.line1 = [[UIView alloc] initWithFrame:CGRectMake(left_w, top_w, lineWidth, numberHeight)];
    self.line1.backgroundColor = self.lineColor;
    [self addSubview:self.line1];
    
    self.line2 = [[UIView alloc] initWithFrame:CGRectMake(left_w + lineWidth + left_center_w, top_w, lineWidth, numberHeight)];
    self.line2.backgroundColor = self.lineColor;
    [self addSubview:self.line2];
    
    self.line3 = [[UIView alloc] initWithFrame:CGRectMake(left_w + 2 * lineWidth + 2 * left_center_w, top_w, lineWidth, numberHeight)];
    self.line3.backgroundColor = self.lineColor;
    [self addSubview:self.line3];
    
    //第一个数字的横线
    self.line4 = [[UIView alloc] initWithFrame:CGRectMake(left_w, top_w, numberWidth, lineWidth)];
    self.line4.backgroundColor = self.lineColor;
    [self addSubview:self.line4];
    
    self.line5 = [[UIView alloc] initWithFrame:CGRectMake(left_w, top_w + lineWidth + top_center_w, numberWidth, lineWidth)];
    self.line5.backgroundColor = self.lineColor;
    [self addSubview:self.line5];
    
    self.line6 = [[UIView alloc] initWithFrame:CGRectMake(left_w, top_w + 2 * lineWidth + 2 * top_center_w, numberWidth, lineWidth)];
    self.line6.backgroundColor = self.lineColor;
    [self addSubview:self.line6];
    
    //第二个数字的竖线
    self.line7 = [[UIView alloc] initWithFrame:CGRectMake(left_w + numberWidth + centerWith, top_w, lineWidth, numberHeight)];
    self.line7.backgroundColor = self.lineColor;
    [self addSubview:self.line7];
    
    self.line8 = [[UIView alloc] initWithFrame:CGRectMake(left_w + lineWidth + left_center_w + numberWidth + centerWith, top_w, lineWidth, numberHeight)];
    self.line8.backgroundColor = self.lineColor;
    [self addSubview:self.line8];
    
    self.line9 = [[UIView alloc] initWithFrame:CGRectMake(left_w + 2 * lineWidth + 2 * left_center_w + numberWidth + centerWith, top_w, lineWidth, numberHeight)];
    self.line9.backgroundColor = self.lineColor;
    [self addSubview:self.line9];
    
    //第二个数字的横线
    self.line10 = [[UIView alloc] initWithFrame:CGRectMake(left_w + numberWidth + centerWith, top_w, numberWidth, lineWidth)];
    self.line10.backgroundColor = self.lineColor;
    [self addSubview:self.line10];
    
    self.line11 = [[UIView alloc] initWithFrame:CGRectMake(left_w + numberWidth + centerWith, top_w + lineWidth + top_center_w, numberWidth, lineWidth)];
    self.line11.backgroundColor = self.lineColor;
    [self addSubview:self.line11];
    
    self.line12 = [[UIView alloc] initWithFrame:CGRectMake(left_w + numberWidth + centerWith, top_w + 2 * lineWidth + 2 * top_center_w, numberWidth, lineWidth)];
    self.line12.backgroundColor = self.lineColor;
    [self addSubview:self.line12];
}

- (void) initColor
{
    self.line1.backgroundColor = self.lineColor;
    self.line2.backgroundColor = self.lineColor;
    self.line3.backgroundColor = self.lineColor;
    self.line4.backgroundColor = self.lineColor;
    self.line5.backgroundColor = self.lineColor;
    self.line6.backgroundColor = self.lineColor;
    self.line7.backgroundColor = self.lineColor;
    self.line8.backgroundColor = self.lineColor;
    self.line9.backgroundColor = self.lineColor;
    self.line10.backgroundColor = self.lineColor;
    self.line11.backgroundColor = self.lineColor;
    self.line12.backgroundColor = self.lineColor;
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    [array addObject:self.line1];
    [array addObject:self.line2];
    [array addObject:self.line3];
    [array addObject:self.line4];
    [array addObject:self.line5];
    [array addObject:self.line6];
    [array addObject:self.line7];
    [array addObject:self.line8];
    [array addObject:self.line9];
    [array addObject:self.line10];
    [array addObject:self.line11];
    [array addObject:self.line12];
    
    for ( int j = 0; j < array.count; j++ ) {
        
        UIView *view = array[j];
        for( int i = 0; i < [view.subviews count]; i++ ){
            [[view.subviews objectAtIndex:i] removeFromSuperview];
        }
    }
    

}

- (void) updateTime:(NSInteger) time
{
    [self initColor];
    
    for( int i = 0; i < [self.line9.subviews count]; i++ ){
        [[self.line9.subviews objectAtIndex:i] removeFromSuperview];
    }
    
    if ( time > 99 || time < 0 ) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"时间不符合规范" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    NSInteger integer = time / 10;
    NSInteger single = time % 10;
    
    //显示第一个数
    if ( integer == 0 ) {
        self.line1.backgroundColor = self.lineLightColor;
        self.line4.backgroundColor = self.lineLightColor;
        self.line3.backgroundColor = self.lineLightColor;
        self.line6.backgroundColor = self.lineLightColor;
    }
    else if ( integer == 1 ) {
        self.line3.backgroundColor = self.lineLightColor;
    }
    else if ( integer == 2 ) {
        
        self.line4.backgroundColor = self.lineLightColor;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.line3.frame.size.width, self.line3.frame.size.height / 2)];
        view.backgroundColor = self.lineLightColor;
        [self.line3 addSubview:view];
        self.line5.backgroundColor = self.lineLightColor;
        
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, self.line1.frame.size.height / 2, self.line1.frame.size.width, self.line1.frame.size.height / 2)];
        view1.backgroundColor = self.lineLightColor;
        [self.line1 addSubview:view1];

        self.line6.backgroundColor = self.lineLightColor;
    }
    else if ( integer == 3 ) {
        self.line3.backgroundColor = self.lineLightColor;
        self.line4.backgroundColor = self.lineLightColor;
        self.line5.backgroundColor = self.lineLightColor;
        self.line6.backgroundColor = self.lineLightColor;
    }
    else if ( integer == 4 ) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.line1.frame.size.width, self.line1.frame.size.height / 2)];
        view.backgroundColor = self.lineLightColor;
        [self.line1 addSubview:view];
        
        self.line5.backgroundColor = self.lineLightColor;
        
        self.line2.backgroundColor = self.lineLightColor;
    }
    else if ( integer == 5 ) {
        self.line4.backgroundColor = self.lineLightColor;
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.line1.frame.size.width, self.line1.frame.size.height / 2)];
        view.backgroundColor = self.lineLightColor;
        [self.line1 addSubview:view];
        
        self.line5.backgroundColor = self.lineLightColor;
        
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, self.line3.frame.size.height / 2, self.line3.frame.size.width, self.line3.frame.size.height / 2)];
        view1.backgroundColor = self.lineLightColor;
        [self.line3 addSubview:view1];
        
        self.line6.backgroundColor = self.lineLightColor;
    }
    else if ( integer == 6 ) {
        self.line4.backgroundColor = self.lineLightColor;
        self.line1.backgroundColor = self.lineLightColor;
        self.line6.backgroundColor = self.lineLightColor;
        self.line5.backgroundColor = self.lineLightColor;

        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, self.line3.frame.size.height / 2, self.line3.frame.size.width, self.line3.frame.size.height / 2)];
        view1.backgroundColor = self.lineLightColor;
        [self.line3 addSubview:view1];
    }
    else if ( integer == 7 ) {
        self.line3.backgroundColor = self.lineLightColor;
        self.line4.backgroundColor = self.lineLightColor;
    }
    else if ( integer == 8 ) {
        self.line3.backgroundColor = self.lineLightColor;
        self.line1.backgroundColor = self.lineLightColor;
        self.line4.backgroundColor = self.lineLightColor;
        self.line5.backgroundColor = self.lineLightColor;
        self.line6.backgroundColor = self.lineLightColor;
    }
    else if ( integer == 9 ) {
        self.line4.backgroundColor = self.lineLightColor;
        self.line5.backgroundColor = self.lineLightColor;
        self.line3.backgroundColor = self.lineLightColor;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.line1.frame.size.width, self.line1.frame.size.height / 2)];
        view.backgroundColor = self.lineLightColor;
        [self.line1 addSubview:view];
        
        self.line6.backgroundColor = self.lineLightColor;
    }
    
    //显示第二个数
    if ( single == 0 ) {
        self.line7.backgroundColor = self.lineLightColor;
        self.line10.backgroundColor = self.lineLightColor;
        self.line9.backgroundColor = self.lineLightColor;
        self.line12.backgroundColor = self.lineLightColor;
    }
    else if ( single == 1 ) {
        self.line9.backgroundColor = self.lineLightColor;
    }
    else if ( single == 2 ) {
        
        self.line10.backgroundColor = self.lineLightColor;
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.line9.frame.size.width, self.line9.frame.size.height / 2)];
        view.backgroundColor = self.lineLightColor;
        [self.line9 addSubview:view];
        
        self.line11.backgroundColor = self.lineLightColor;
        
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, self.line7.frame.size.height / 2, self.line7.frame.size.width, self.line7.frame.size.height / 2)];
        view1.backgroundColor = self.lineLightColor;
        [self.line7 addSubview:view1];
        
        self.line12.backgroundColor = self.lineLightColor;
    }
    else if ( single == 3 ) {
        self.line9.backgroundColor = self.lineLightColor;
        self.line10.backgroundColor = self.lineLightColor;
        self.line11.backgroundColor = self.lineLightColor;
        self.line12.backgroundColor = self.lineLightColor;
    }
    else if ( single == 4 ) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.line7.frame.size.width, self.line7.frame.size.height / 2)];
        view.backgroundColor = self.lineLightColor;
        [self.line7 addSubview:view];
        
        self.line11.backgroundColor = self.lineLightColor;
        
        self.line8.backgroundColor = self.lineLightColor;
    }
    else if ( single == 5 ) {
        self.line10.backgroundColor = self.lineLightColor;
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.line7.frame.size.width, self.line7.frame.size.height / 2)];
        view.backgroundColor = self.lineLightColor;
        [self.line7 addSubview:view];
        
        self.line11.backgroundColor = self.lineLightColor;
        
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, self.line9.frame.size.height / 2, self.line9.frame.size.width, self.line9.frame.size.height / 2)];
        view1.backgroundColor = self.lineLightColor;
        [self.line9 addSubview:view1];
        
        self.line12.backgroundColor = self.lineLightColor;
    }
    else if ( single == 6 ) {
        self.line10.backgroundColor = self.lineLightColor;
        self.line7.backgroundColor = self.lineLightColor;
        self.line12.backgroundColor = self.lineLightColor;
        self.line11.backgroundColor = self.lineLightColor;
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, self.line9.frame.size.height / 2, self.line9.frame.size.width, self.line9.frame.size.height / 2)];
        view.backgroundColor = self.lineLightColor;
        [self.line9 addSubview:view];
    }
    else if ( single == 7 ) {
        self.line9.backgroundColor = self.lineLightColor;
        self.line10.backgroundColor = self.lineLightColor;
    }
    else if ( single == 8 ) {
        self.line9.backgroundColor = self.lineLightColor;
        self.line7.backgroundColor = self.lineLightColor;
        self.line10.backgroundColor = self.lineLightColor;
        self.line11.backgroundColor = self.lineLightColor;
        self.line12.backgroundColor = self.lineLightColor;
    }
    else if ( single == 9 ) {
        self.line10.backgroundColor = self.lineLightColor;
        self.line11.backgroundColor = self.lineLightColor;
        self.line9.backgroundColor = self.lineLightColor;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.line7.frame.size.width, self.line7.frame.size.height / 2)];
        view.backgroundColor = self.lineLightColor;
        [self.line7 addSubview:view];
        
        self.line12.backgroundColor = self.lineLightColor;
    }

    
}

@end

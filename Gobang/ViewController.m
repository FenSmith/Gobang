//
//  ViewController.m
//  Gobang
//
//  Created by tangwei on 16/8/11.
//  Copyright © 2016年 tangwei. All rights reserved.
//

#import "ViewController.h"
#import "ViewCountDown.h"

@interface ViewController ()

@property (nonatomic) ViewCountDown *viewCountDown;
@property (nonatomic, strong)  dispatch_source_t              timer;
@property (nonatomic,strong) UITextField *inputTime;
@property (nonatomic, assign) NSInteger time;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self init_data];
    [self init_ui];
}

- (void) init_data
{
    self.time = 0;
}

- (void) init_ui
{
    self.viewCountDown = [[ViewCountDown alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, 100)];
    [self.view addSubview:self.viewCountDown];
    
    UILabel *labelCountDown = [[UILabel alloc] initWithFrame:CGRectMake(15, 250, 100, 20)];;
    labelCountDown.text = @"倒计时秒数:";
    [self.view addSubview:labelCountDown];
    
    self.inputTime = [[UITextField alloc] initWithFrame:CGRectMake(120, 250, ScreenWidth, 20)];
    self.inputTime.placeholder = @"请输入倒计时时间";
    self.inputTime.textColor = [UIColor blackColor];
    self.inputTime.returnKeyType = UIReturnKeyDone;
    self.inputTime.text = @"99";//@"18762
    [self.view addSubview:self.inputTime];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(15, 300, ScreenWidth - 30, 50)];
    [btn setTitle:@"开始倒计时" forState:UIControlStateNormal];
    [btn setTitleColor:UIColorFromHex(0x8880ee) forState:UIControlStateNormal];
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [btn addTarget:self action:@selector(countDown) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
}

- (void) countDown
{
    self.time = [self.inputTime.text integerValue];
    [self.viewCountDown updateTime:self.time];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.time --;
            
            [self.viewCountDown updateTime:self.time];
            
            if ( self.time <= 0 ) {
                dispatch_source_cancel(_timer);
            }
        });
        
    });
    dispatch_resume(_timer);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

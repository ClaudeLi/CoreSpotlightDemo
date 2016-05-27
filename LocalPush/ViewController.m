//
//  ViewController.m
//  LocalPush
//
//  Created by ClaudeLi on 16/5/26.
//  Copyright © 2016年 ClaudeLi. All rights reserved.
//

#import "ViewController.h"
#import "LocalPushManager.h"
#import "CoreSpotlightManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton* button = [UIButton new];
    button.frame = CGRectMake(100, 100, 100, 50);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"添加通知" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [CoreSpotlightManager saveDataWith:@[@"web", @"image", @"text"]];
}

- (void)clickButtonAction{
    NSLog(@"注册通知");
    // 设置10秒之后提醒
    // 可在方法中将dateWithTimeIntervalSinceNow改为dateWithTimeIntervalSince1970 自定时间发送通知
    [LocalPushManager registerLocalNotification:10 title:@"hello world！"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

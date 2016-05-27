//
//  LocalPushManager.h
//  Trip
//
//  Created by ClaudeLi on 16/5/13.
//  Copyright © 2016年 MonetWu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define LocalPushKey    @"LocalPushKey"

@interface LocalPushManager : NSObject

/**
 *  注册本地通知
 *
 *  @param alertTime 触发时间距离现在多久，单位秒
 *  @param title     通知title
 */
+ (void)registerLocalNotification:(NSInteger)alertTime title:(NSString *)title;

/**
 *  取消所有本地通知
 *
 *  @param key 注册通知的Key值
 */
+ (void)cancelLocalNotificationWithKey:(NSString *)key;

@end

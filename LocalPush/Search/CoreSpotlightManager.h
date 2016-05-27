//
//  CoreSpotlightManager.h
//  LocalPush
//
//  Created by ClaudeLi on 16/5/26.
//  Copyright © 2016年 ClaudeLi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CoreSpotlightManager : NSObject

// 将需要索引的数据保存至CoreSpotlight
+ (void)saveDataWith:(NSArray *)dataArray;

// 根据identifier来删除
+ (void)removeSearchItemsWith:(NSArray *)dataArray;

// 删除所有索引
+ (void)removeAllSearchItems;

@end

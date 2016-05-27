//
//  CoreSpotlightManager.m
//  LocalPush
//
//  Created by ClaudeLi on 16/5/26.
//  Copyright © 2016年 ClaudeLi. All rights reserved.
//

#import "CoreSpotlightManager.h"
#import <CoreSpotlight/CoreSpotlight.h>

@implementation CoreSpotlightManager

+ (void)saveDataWith:(NSArray *)dataArray{
//    NSArray *array = @[@"web",@"image",@""];
    NSMutableArray *seachableItems = [NSMutableArray new];
    [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CSSearchableItemAttributeSet *attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:@"ClaudeLi"];
        attributeSet.title = obj;
        attributeSet.contentDescription = [NSString stringWithFormat:@"This is a demo test"];
        UIImage *thumbImage = [UIImage imageNamed:@"icon_web.png"];
        attributeSet.thumbnailData = UIImagePNGRepresentation(thumbImage);//beta 1 there is a bug
        attributeSet.keywords = @[@"ni", @"wo", @"ta"]; // 关键字
        CSSearchableItem *item = [[CSSearchableItem alloc] initWithUniqueIdentifier:obj                                                                                                                                    domainIdentifier:@"com.claudeli.demo" attributeSet:attributeSet];
        [seachableItems addObject:item];
    }];
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:seachableItems
                                                   completionHandler:^(NSError * __nullable error) {                                                              if (!error)
                                                       NSLog(@"%@",error.localizedDescription);
                                                   }];
}

+ (void)removeSearchItemsWith:(NSArray *)dataArray{
    [[CSSearchableIndex defaultSearchableIndex] deleteSearchableItemsWithDomainIdentifiers:dataArray completionHandler:^(NSError * _Nullable error) {
        if (error)
            NSLog(@"%@",error.localizedFailureReason);
    }];
}

+ (void)removeAllSearchItems{
  [[CSSearchableIndex defaultSearchableIndex] deleteAllSearchableItemsWithCompletionHandler:^(NSError * _Nullable error) {
      if (error) {
          NSLog(@"%@", error.localizedFailureReason);
      }
  }];
}

@end

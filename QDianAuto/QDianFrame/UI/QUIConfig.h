//
//  UIConfig.h
//  QDianAuto
//
//  Created by 崔宇科 on 15/1/11.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QUIConfig : NSObject
{
    NSDictionary *configDictionary;
}

+ (QUIConfig *)shareUIConfig;


- (NSInteger)getLeftItem;
- (float)getHeaderHeight;


@end

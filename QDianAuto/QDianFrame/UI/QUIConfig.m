//
//  UIConfig.m
//  QDianAuto
//
//  Created by 崔宇科 on 15/1/11.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUIConfig.h"

static QUIConfig *uiConfig = nil;

@implementation QUIConfig

+ (QUIConfig *)shareUIConfig
{
    if (uiConfig == nil)
    {
        uiConfig = [[QUIConfig alloc] init];
    }
    
    return uiConfig;
}

- (id)init
{
    if ((self = [super init]) != nil)
    {
        NSString *pListPath = [[NSBundle mainBundle] pathForResource:@"UIConfig" ofType:@"plist"];
        configDictionary    = [[NSDictionary alloc] initWithContentsOfFile:pListPath];
    }
    
    return self;
}


- (NSInteger)getLeftItem
{
    return [[[configDictionary objectForKey:@"LeftUI"] objectForKey:@"ItemCount"] integerValue];
}

- (float)getHeaderHeight
{
    return [[[configDictionary objectForKey:@"LeftUI"] objectForKey:@"HeaderHeight"] floatValue];
}


@end

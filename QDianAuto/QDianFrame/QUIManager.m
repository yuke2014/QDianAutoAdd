//
//  QUIManager.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/16.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUIManager.h"
#import "QUIMessage.h"

static QUIManager *uiManager = nil;

@implementation QUIManager


+ (QUIManager *)shareUIManager
{
    if (uiManager == nil)
    {
        uiManager = [[QUIManager alloc] init];
    }
    
    return uiManager;
}

- (id)init
{
    if ((self = [super init]) != nil)
    {
        uiDictionary = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (void)registerUI:(id<QUi>)ui withName:(NSString *)name
{
    [uiDictionary setObject:ui forKey:name];
}


- (id<QUi>)obtainUI:(NSString *)key
{
    
    return [uiDictionary objectForKey:key];
}

- (QUIMessage *)genMessageType:(NSString *)aName withIntValue:(NSInteger)aLen withType:(NSInteger)aType withDName:(NSString *)dName
{
    QUIMessage *sendMessage = [[QUIMessage alloc] init];
    sendMessage.mName = aName;
    sendMessage.mLen  = aLen;
    sendMessage.mType = aType;
    sendMessage.dName = dName;
    return sendMessage;
}

@end

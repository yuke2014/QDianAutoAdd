//
//  QUIMessageManager.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/19.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUIMessageManager.h"
#import "QUIStateManager.h"

static QUIMessageManager *quiMessageManager;

@implementation QUIMessageManager

/*+ (QUIMessageManager *)shareMessageManager
{
    if (quiMessageManager == nil)
    {
        quiMessageManager = [[QUIMessageManager alloc] init];
    }
    
    return quiMessageManager;
}

- (id<QUIMessage>)createUpdateMessageType:(NSInteger)aType;
{
    id<QUIMessage> updateMessage;
    switch (aType)
    {
        case 0:
        {
            updateMessage = [[QUIUpdateMessage alloc] init];
            updateMessage.mType    = 0;
            updateMessage.mName    = @"updateLeft";
            updateMessage.mContent = [[QUIStateManager shareUIStateManager] createLeftStateWithName:nil];
        }
            break;
        case 1:
            break;
            
        default:
            break;
    }
    
    return updateMessage;
}*/

@end

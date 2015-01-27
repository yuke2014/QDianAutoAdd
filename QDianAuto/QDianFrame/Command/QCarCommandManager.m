//
//  QCarCommandManager.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/27.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QCarCommandManager.h"

static QCommandManager *qCommandManager = nil;


@implementation QCarCommandManager

+ (QCommandManager *)shareCommandManager
{
    if (qCommandManager == nil)
    {
        qCommandManager = [[self alloc] init];
    }
    
    return qCommandManager;
}

- (id<QCommand>)createQCommand:(NSString *)classname withRobot:(id)aRobot
{
    return [((id<QCommand>)[NSClassFromString(classname) alloc]) initWithAuto:aRobot];
}

- (void)commitQueue
{
    //这里构建指令队列统一处理，如sphero 就是使用RKMacroObject
    for(int i = 0;i < [currentQueue count];i++)
    {
        id<QCommand> command = [currentQueue objectAtIndex:i];
        [command execute];//在这里依次把返回值add进去
    }
    
    //最后执行
}


@end

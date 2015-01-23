//
//  QCommandManage.h
//  QDianAuto
//
//  Created by cuiyk on 15/1/21.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QCommand.h"

@interface QCommandManager : NSObject
{
    NSMutableArray *currentQueue;
}

+ (QCommandManager *)shareCommandManager;


- (void)addCommandToQueue:(id<QCommand>)qCommand;
- (void)removeCommandFromQueue:(id<QCommand>)qCommand;
- (NSInteger)queueCount;

- (void)commitQueue;
- (id<QCommand>)createQCommand:(NSString *)classname withRobot:(id)aRobot;


@end

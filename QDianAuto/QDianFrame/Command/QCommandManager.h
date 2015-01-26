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

@property NSInteger selectedCommand;

+ (QCommandManager *)shareCommandManager;


- (void)addCommandToQueue:(id<QCommand>)qCommand;
- (void)removeCommandFromQueue:(id<QCommand>)qCommand;
- (void)removeCommandWithName:(NSString *)name;
- (id<QCommand>)obtainCommandWithIndex:(NSInteger)index;
- (id<QCommand>)obtainSelectedCommand;
- (NSInteger)queueCount;
- (NSArray *)buildSaveCommand;


- (void)printQueueName;

- (void)commitQueue;
- (id<QCommand>)createQCommand:(NSString *)classname withRobot:(id)aRobot;


@end

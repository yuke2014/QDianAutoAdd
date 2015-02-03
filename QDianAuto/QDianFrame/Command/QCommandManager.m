//
//  QCommandManage.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/21.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QCommandManager.h"

@implementation QCommandManager

+ (QCommandManager *)shareCommandManager
{
//    if (qCommandManager == nil)
//    {
//        qCommandManager = [[self alloc] init];
//    }
//    
//    return qCommandManager;
    
    return nil;
}


- (id)init
{
    if ((self = [super init]) != nil)
    {
        currentQueue = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)addCommandToQueue:(id<QCommand>)qCommand
{
    
    [currentQueue addObject:qCommand];
}

- (void)removeCommandFromQueue:(id<QCommand>)qCommand
{
    [currentQueue removeObject:qCommand];
}

- (void)removeCommandWithName:(NSString *)name withIndex:(NSInteger)index
{
    NSInteger len = [currentQueue count];
    for (int i = 0; i < len; i++)
    {
        id<QCommand> command = [currentQueue objectAtIndex:i];
        NSString *cName = NSStringFromClass([command class]);
        if ([cName isEqualToString:name] && (i == index))
        {
            [currentQueue removeObject:command];
            break;
        }
    }
    
    /*for (id<QCommand> command in currentQueue)
    {
        NSString *cName = NSStringFromClass([command class]);
        if ([cName isEqualToString:name])
        {
            [currentQueue removeObject:command];
        }
        
    }*/
}


- (NSInteger)queueCount
{
    return [currentQueue count];
}

- (NSMutableArray *)queue
{
    return currentQueue;
}

- (id<QCommand>)obtainCommandWithIndex:(NSInteger)index
{
    return [currentQueue objectAtIndex:index];
}

- (id<QCommand>)obtainSelectedCommand
{
    return [currentQueue objectAtIndex:_selectedCommand];
}

- (void)clearAllCommand
{
    [currentQueue removeAllObjects];
}

- (NSDictionary *)obtainParamConfig
{
    NSString *pListPath = [[NSBundle mainBundle] pathForResource:@"BallCommandDes" ofType:@"plist"];
    NSDictionary  *paramConfig    = [[NSMutableDictionary alloc] initWithContentsOfFile:pListPath];
    
    return paramConfig;

}

- (NSString *)genButtonDisplay:(NSInteger)index
{
    id<QCommand> c = [currentQueue objectAtIndex:index];
    
    NSString *pListPath = [[NSBundle mainBundle] pathForResource:@"BallCommandDes" ofType:@"plist"];
    NSMutableDictionary *paramConfig    = [[NSMutableDictionary alloc] initWithContentsOfFile:pListPath];
    
    NSDictionary *pDic = [paramConfig objectForKey:NSStringFromClass([c class])];
    NSArray *pList     = [pDic objectForKey:@"param"];
    
    NSMutableString *resultString = [[NSMutableString alloc] init];
    
    NSInteger len = 0;
    if ([pList count] > 3)
    {
        len = 3;
    }
    else
    {
        len = (NSInteger)[pList count];
    }
    
    for (int i = 0; i < [pList count]; i++)
    {
        NSInteger v = [[c.p objectForKey:[NSNumber numberWithInt:i]] integerValue];
        NSString  *name = [[[pList objectAtIndex:i] componentsSeparatedByString:@"&"] objectAtIndex:0];
        NSString *oneParam = [NSString stringWithFormat:@"%@:%ld ",name,v];
        [resultString appendString:oneParam];
                              
    }
    
    return resultString;
    
}

- (void)printQueueName
{
    for (int i = 0; i < [currentQueue count]; i++)
    {
        id<QCommand> command = [currentQueue objectAtIndex:i];
        NSLog(@"command class is : %@",NSStringFromClass([command class]));
    }
}

- (NSArray *)buildSaveCommand
{
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < [currentQueue count]; i++)
    {
        id<QCommand> command = [currentQueue objectAtIndex:i];
        NSString *className = NSStringFromClass([command class]);
        NSMutableString *paramString = [[NSMutableString alloc] init];
        [paramString appendString:className];
        NSArray *keyArray = [command.p allKeys];
        for (int i = 0; i < keyArray.count; i++)
        {
            [paramString appendFormat:@"&%f",[[command.p objectForKey:[NSNumber numberWithInt:i]] floatValue]];
        }
        [resultArray addObject:paramString];
    }
    
    return [NSArray arrayWithArray:resultArray];
    
}

#pragma mark -
#pragma mark interface

- (void)commitQueue
{
    
}

- (id<QCommand>)createQCommand:(NSString *)classname withRobot:(id)aRobot
{
    return nil;
}





@end

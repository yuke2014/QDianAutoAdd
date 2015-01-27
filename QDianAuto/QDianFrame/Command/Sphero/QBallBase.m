//
//  QBallBase.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/21.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QBallBase.h"
#import "QBallCommandManager.h"


@implementation QBallBase

@synthesize p;


- (id)initWithAuto:(id)robot
{
    if ((self = [super init]) != nil)
    {
        iRobot = robot;
        p = [[NSMutableDictionary alloc] init];
        //NSLog(@"QBallBase class name is : %@",NSStringFromClass([self class]));
        QCommandManager *ballManager = [QBallCommandManager shareCommandManager];
        NSDictionary *pDic = [ballManager obtainParamConfig];
        
        NSDictionary *dic = [pDic objectForKey:NSStringFromClass([self class])];
        NSArray      *array = [dic objectForKey:@"param"];
        
        for (int i = 0; i < array.count; i++)
        {
            [p setObject:@0 forKey:[NSNumber numberWithInt:i]];
        }

        
        
    }
    return self;
}

- (id)execute
{
    return nil;
}


@end

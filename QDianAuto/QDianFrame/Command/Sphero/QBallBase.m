//
//  QBallBase.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/21.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QBallBase.h"


@implementation QBallBase

@synthesize p;


- (id)initWithAuto:(id)robot
{
    if ((self = [super init]) != nil)
    {
        iRobot = robot;
        p = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (id)execute
{
    return nil;
}


@end

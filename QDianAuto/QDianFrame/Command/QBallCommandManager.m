//
//  QBallCommandManager.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/21.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QBallCommandManager.h"

@implementation QBallCommandManager


- (id<QCommand>)createQCommand:(NSString *)classname withRobot:(id)aRobot
{
    return [((id<QCommand>)[NSClassFromString(classname) alloc]) initWithAuto:aRobot];
}

- (void)commitQueue
{
    
}

@end

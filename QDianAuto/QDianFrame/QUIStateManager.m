//
//  QUIStateManager.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/16.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUIStateManager.h"


static QUIStateManager *stateManager = nil;

@implementation QUIStateManager

+ (QUIStateManager *)shareUIStateManager
{
    if (stateManager == nil)
    {
        stateManager = [[QUIStateManager alloc] init];
    }
    
    return stateManager;
}

- (id<QUIState>)createLeftStateWithName:(id)name
{
    if ([name isEqualToString:@"LeftNormal"])
     {
         return [[QUIBallLeftStateNormal alloc] initWithFrame:CGRectMake(0, 0, 110, 680)];

     }
     else
     {
         return [[QUIBallLeftStateProgramme alloc] initWithFrame:CGRectMake(0, 0, 110, 680)];
     }
}

- (id<QUIState>)createMiddleStateWithName:(id)name
{
    if ([name isEqualToString:@"MiddleNormal"])
    {
        return [[QUIBallMiddleStateNormal alloc] initWithFrame:CGRectMake(0.0, 0.0, 685, 680)];

    }
    else
    {
        return [[QUIBallMiddleStateProgramme alloc] initWithFrame:CGRectMake(0.0, 0.0, 685, 680)];
    }
    
    
}

- (id<QUIState>)createRightStateWithName:(id)name
{
    if ([name isEqualToString:@"RightNormal"])
    {
        return [[QUIRightStateNormal alloc] initWithFrame:CGRectMake(0.0, 0.0, 230, 400)];
    }
    else
    {
        return [[QUIBallRightStateProgramme alloc] initWithFrame:CGRectMake(0.0, 0.0, 230, 400)];
    }
}

- (id<QUIState>)createTopBarStateWithName:(id)name
{
    if ([name isEqualToString:@"TopNormal"])
    {
        return [[QUITopBarState alloc] initWithFrame:CGRectMake(0.0, 0.0, 1024, 70)];
    }
    else
    {
        return [[QUITopBarStateSetting alloc] initWithFrame:CGRectMake(0.0, 0.0, 1024, 70)];
    }
}

@end

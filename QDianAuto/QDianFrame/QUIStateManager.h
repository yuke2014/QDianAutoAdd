//
//  QUIStateManager.h
//  QDianAuto
//
//  Created by cuiyk on 15/1/16.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QUIBallLeftStateNormal.h"
#import "QUIBallMiddleStateNormal.h"
#import "QUIBallLeftStateProgramme.h"
#import "QUIBallMiddleStateProgramme.h"
#import "QUIBallRightStateProgramme.h"
#import "QUIRightStateNormal.h"
#import "QUITopBarState.h"
#import "QUITopBarStateSetting.h"




@interface QUIStateManager : NSObject


+ (QUIStateManager *)shareUIStateManager;


- (id<QUIState>)createLeftStateWithName:(id)name;
- (id<QUIState>)createMiddleStateWithName:(id)name;
- (id<QUIState>)createRightStateWithName:(id)name;
- (id<QUIState>)createTopBarStateWithName:(id)name;


@end

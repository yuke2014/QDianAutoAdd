//
//  QUITopModal.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/23.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUITopModal.h"
#import "QBallCommandManager.h"

@implementation QUITopModal
@synthesize stateView;

- (NSString *)modalName
{
    return @"TopModal";
}

- (void)playButtonDown:(id)sender
{
    //[[QCommandManager shareCommandManager] printQueueName];
    
    [[QBallCommandManager shareCommandManager] commitQueue];
}

- (void)backToMain:(id)sender
{
    
    NSArray *saveArray = [[QBallCommandManager shareCommandManager] buildSaveCommand];
    [[ProgrammeBallManager shareProgrammeManager] saveCurrentProgramme:saveArray];
    
    id<QUIState> nStateLeft = [[QUIStateManager shareUIStateManager] createLeftStateWithName:@"LeftNormal"];
    id<QUi>      nUI    = [[QUIManager shareUIManager] obtainUI:@"Left"];
    [nUI setState:nStateLeft];
    [nUI reloadUI];
    
    
    id<QUIState> nStateMiddle = [[QUIStateManager shareUIStateManager] createMiddleStateWithName:@"MiddleNormal"];
    id<QUi>      nUIMiddle    = [[QUIManager shareUIManager] obtainUI:@"Middle"];
    [nUIMiddle setState:nStateMiddle];
    [nUIMiddle reloadUI];
    
    id<QUIState> nStateTop = [[QUIStateManager shareUIStateManager] createTopBarStateWithName:@"TopNormal"];
    id<QUi>      nUITop    = [[QUIManager shareUIManager] obtainUI:@"Top"];
    [nUITop setState:nStateTop];
    [nUITop reloadUI];
    
    id<QUIState> nStateRight = [[QUIStateManager shareUIStateManager] createRightStateWithName:@"RightNormal"];
    id<QUi>      nUIRight    = [[QUIManager shareUIManager] obtainUI:@"Right"];
    [nUIRight setState:nStateRight];
    [nUIRight reloadUI];
    
    [[QBallCommandManager shareCommandManager] clearAllCommand];
    
    
}

@end

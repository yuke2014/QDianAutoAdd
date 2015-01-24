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

@end

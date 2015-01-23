//
//  QUIMiddleModal.m
//  QDianAuto
//
//  Created by 崔宇科 on 15/1/17.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUIMiddleModal.h"
#import "QUIManager.h"
#import "QUIStateManager.h"

@implementation QUIMiddleModal
@synthesize stateView;

- (NSString *)modalName
{
    return @"LeftModal";
}


- (void)carCodeSelected:(id)sender
{
    id<QUIState> nStateLeft = [[QUIStateManager shareUIStateManager] createLeftStateWithName:@"LeftProgrammer"];
    id<QUi>      nUI    = [[QUIManager shareUIManager] obtainUI:@"Left"];
    [nUI setState:nStateLeft];
    [nUI reloadUI];
    
    
    id<QUIState> nStateMiddle = [[QUIStateManager shareUIStateManager] createMiddleStateWithName:@"ddd"];
    id<QUi>      nUIMiddle    = [[QUIManager shareUIManager] obtainUI:@"Middle"];
    [nUIMiddle setState:nStateMiddle];
    [nUIMiddle reloadUI];
    
    id<QUIState> nStateTop = [[QUIStateManager shareUIStateManager] createTopBarStateWithName:@"dd"];
    id<QUi>      nUITop    = [[QUIManager shareUIManager] obtainUI:@"Top"];
    [nUITop setState:nStateTop];
    [nUITop reloadUI];

}


#pragma mark -
#pragma mark programme area






@end

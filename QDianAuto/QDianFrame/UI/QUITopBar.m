//
//  QUITopBar.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/20.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUITopBar.h"
#import "QUIStateManager.h"

@implementation QUITopBar

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]) != nil)
    {
        topState = [[QUIStateManager shareUIStateManager] createTopBarStateWithName:@"TopNormal"];
    }
    
    
    return self;
}


- (void)genProgrammeState
{
    
}


- (void)setState:(id<QUIState>)changedState
{
    [((UIView *)topState) removeFromSuperview];
    topState = changedState;
}
- (void)reloadUI
{
    [topState loadUI:self];
}
- (void)loadUI
{
    [topState loadUI:self];
}
- (void)updateUI:(id)message
{
    
}


@end

//
//  UIRight.m
//  QDianAuto
//
//  Created by 崔宇科 on 15/1/11.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUIRight.h"

@implementation QUIRight

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]) != nil)
    {
        rightState = [[QUIStateManager shareUIStateManager] createRightStateWithName:@"RightNormal"];
        
    }
    
    
    return self;
}


- (void)setState:(id<QUIState>)changedState
{
    
}

- (void)reloadUI
{
    [rightState loadUI:self];
}

- (void)loadUI
{
    [rightState loadUI:self];
}

- (void)updateUI:(id)message
{
    [rightState updateUI:message];
}


@end

//
//  CommandButton.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/22.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "CommandButton.h"
#import "QUIStateManager.h"


@implementation CommandButton

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    QUIStateManager *sManager = [QUIStateManager shareUIStateManager];
    if (sManager.middleTouchState == 1)
    {
        return [self superview];
    }
    else
    {
        return [super hitTest:point withEvent:event];
    }
    
}


@end

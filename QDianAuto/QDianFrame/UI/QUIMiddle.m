//
//  UIMiddle.m
//  QDianAuto
//
//  Created by 崔宇科 on 15/1/11.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUIMiddle.h"
#import "UIView+FastAnimation.h"


@implementation QUIMiddle


- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]) != nil)
    {
        middleState       = [[QUIStateManager shareUIStateManager] createMiddleStateWithName:@"MiddleNormal"];
        
    }
    
    
    return self;
}



- (void)setState:(id<QUIState>)changedState
{
    [((UIView *)middleState) removeFromSuperview];
    middleState = changedState;
}

- (void)reloadUI
{
    UIView *stateView = (UIView *)middleState;
    stateView.animationType = @"ZoomInY";
    [middleState loadUI:self];
    
    [stateView startFAAnimation];

}

- (void)loadUI
{
    UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height)];
    background.image = [UIImage imageNamed:@"透明黑色底.png"];
    [self addSubview:background];
    

    [middleState loadUI:self];
}

- (void)updateUI:(id)message
{
    [middleState updateUI:message];
}


@end

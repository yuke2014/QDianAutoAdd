//
//  UILeft.m
//  QDianAuto
//
//  Created by 崔宇科 on 15/1/11.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUILeft.h"
#import "QUIConfig.h"
#import "UIView+FastAnimation.h"


@implementation QUILeft


- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]) != nil)
    {
        state       = [[QUIStateManager shareUIStateManager] createLeftStateWithName:@"LeftNormal"];
        
    }
    
    
    return self;
}


#pragma mark -
#pragma Frame Method

- (void)setState:(id<QUIState>)changedState
{
    /*CATransition *caSwitch = [CATransition animation];
    caSwitch.delegate = self;
    caSwitch.duration = 1.25;
    caSwitch.timingFunction = UIViewAnimationCurveEaseInOut;
    caSwitch.type = @"cube";*/

    [((UIView *)state) removeFromSuperview];
    state = changedState;
    
    /*[state loadUI:self];
    caSwitch.subtype = kCATransitionFromTop;
    [[self layer] addAnimation:caSwitch forKey:@"switch"];*/

}

- (void)reloadUI
{
    UIView *stateView = (UIView *)state;
    stateView.animationType = @"ZoomInY";
    [state loadUI:self];
    
    [stateView startFAAnimation];

}

- (void)loadUI
{
    UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height)];
    background.image = [UIImage imageNamed:@"透明黑色底.png"];
    [self addSubview:background];

    
    [state loadUI:self];
    
    
}


- (void)updateUI:(id)message
{
    
}










@end

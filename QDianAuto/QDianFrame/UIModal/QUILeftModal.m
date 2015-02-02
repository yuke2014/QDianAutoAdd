//
//  QUILeftModal.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/15.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUILeftModal.h"
#import "QUIStateManager.h"
#import "QUIManager.h"
#import "QUIWelcomState.h"

@implementation QUILeftModal
@synthesize stateView;

- (NSString *)modalName
{
    return @"LeftModal";
}


- (void)ballAction:(id)sender
{
    id<QUIState> nStateMiddle = [[QUIStateManager shareUIStateManager] createMiddleStateWithName:@"MiddleNormal"];
    id<QUi>      nUIMiddle    = [[QUIManager shareUIManager] obtainUI:@"Middle"];
    [nUIMiddle setState:nStateMiddle];
    [nUIMiddle reloadUI];

}

- (void)driveCab:(id)sender
{
    QUIWelcomState *q = [[QUIWelcomState alloc] initWithFrame:CGRectMake(0.0, 0.0, 685, 680)];
    id<QUi>      nUIMiddle    = [[QUIManager shareUIManager] obtainUI:@"Middle"];
    [nUIMiddle setState:q];
    [nUIMiddle reloadUI];

}

- (void)carAction:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"已经断开小球连接" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    [alert show];
}

- (void)didConnected_Sphero_Online
{
    /*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"已经成功连接小球!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    [alert show];*/
}
- (void)didDisConnected_Sphero_Online
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"已经断开小球连接" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    [alert show];

}


@end

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
#import "CommandButton.h"

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

- (void)deleteSelected:(id)sender
{
    CommandButton *cButton = (CommandButton *)[sender superview];

    QCommandManager *commandManager = [QCommandManager shareCommandManager];
    NSInteger endIndex   = [commandManager queueCount] + CBUTTON_BASE - 1;
    NSInteger beginIndex = cButton.tag;

    [commandManager removeCommandWithName:cButton.commandName];
    [[sender superview] removeFromSuperview];
    
    for (NSInteger i = beginIndex + 1; i <= endIndex; i++)
    {
        UIView *ajustView = [stateView viewWithTag:i];
        ajustView.tag = ajustView.tag - 1;
        ajustView.frame   = CGRectMake(ajustView.frame.origin.x, ajustView.frame.origin.y - 80, ajustView.frame.size.width, ajustView.frame.size.height);
    }
    
    
}

- (void)commandSelected:(UILongPressGestureRecognizer *)gesture
{
    UIImage *cancelImage     = [UIImage imageNamed:@"彩条取消图标.png"];
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame     = CGRectMake(550, 18, 20, 20);
    [cancelButton setImage:cancelImage forState:UIControlStateNormal];
    
    [cancelButton addTarget:self action:@selector(deleteSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [gesture.view addSubview:cancelButton];

}


#pragma mark -
#pragma mark programme area






@end

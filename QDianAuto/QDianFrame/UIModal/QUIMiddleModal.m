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
#import "UIView+FastAnimation.h"
#import "POP/POP.h"


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
    
    id<QUIState> nStateRight = [[QUIStateManager shareUIStateManager] createRightStateWithName:@"dd"];
    id<QUi>      nUIRight    = [[QUIManager shareUIManager] obtainUI:@"Right"];
    [nUIRight setState:nStateRight];
    [nUIRight reloadUI];

}

- (void)deleteSelected:(id)sender
{
    CommandButton *cButton = (CommandButton *)[sender superview];
    QCommandManager *commandManager = [QCommandManager shareCommandManager];
    NSInteger endIndex   = [commandManager queueCount] + CBUTTON_BASE - 1;
    NSInteger beginIndex = cButton.tag;

    [commandManager removeCommandWithName:cButton.commandName];
    UIView *removeView = [sender superview];
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    positionAnimation.fromValue = [NSValue valueWithCGRect:cButton.frame];
    positionAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(cButton.center.x+30, cButton.center.y, 0, 0)];
    positionAnimation.springBounciness = 15.0f;
    positionAnimation.springSpeed = 30.0f;
    
    

    
    positionAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished)
    {
        if (finished)
        {
            [removeView removeFromSuperview];
            for (NSInteger i = beginIndex + 1; i <= endIndex; i++)
            {
                POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
                
                UIView *ajustView = [stateView viewWithTag:i];
                CGPoint point = ajustView.center;

                ajustView.tag = ajustView.tag - 1;
                springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(point.x, point.y - 80)];
                springAnimation.springBounciness = 20.0;
                springAnimation.springSpeed = 20.0;
                [ajustView pop_addAnimation:springAnimation forKey:@"changeposition"];

                //ajustView.frame   = CGRectMake(ajustView.frame.origin.x, ajustView.frame.origin.y - 80, ajustView.frame.size.width, ajustView.frame.size.height);
                //[ajustView startFAAnimation];
            }
        }
    };
    [removeView pop_addAnimation:positionAnimation forKey:@"aaaa"];
    
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

- (void)commandTouched:(id)sender
{
    CommandButton *button = (CommandButton *)sender;
    NSLog(@"selelcted button is : %d",button.tag);
    [QBallCommandManager shareCommandManager].selectedCommand = button.tag - CBUTTON_BASE;
    
    QUIMessage *message = [[QUIManager shareUIManager] genMessageType:button.commandName withIntValue:0 withType:0 withDName:@"NO"];
    
    id<QUi> rUpdateUi = [[QUIManager shareUIManager] obtainUI:@"Right"];
    [rUpdateUi updateUI:message];

}


#pragma mark -
#pragma mark programme area






@end

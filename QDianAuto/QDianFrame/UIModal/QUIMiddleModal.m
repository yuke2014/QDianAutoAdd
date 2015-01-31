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
#import "ProgrammeButton.h"
#import "QUIBallMiddleStateProgramme.h"
#import "MusicEffectPlay.h"


@implementation QUIMiddleModal
@synthesize stateView;

- (NSString *)modalName
{
    return @"LeftModal";
}

- (void)allChangeToProgramme
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


- (void)addCodeSelected:(id)sender
{
    if ([ProgrammeBallManager shareProgrammeManager].fileCount == 9)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"目前只允许创建9个自定义程序。。" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    [QUIStateManager shareUIStateManager].stateOperator = BALLADD;
    [ProgrammeBallManager shareProgrammeManager].selectedProgramme = [ProgrammeBallManager shareProgrammeManager].maxFileName + 1;
    [self allChangeToProgramme];
    
}

- (void)deleteSelected:(id)sender
{
    CommandButton *cButton = (CommandButton *)[sender superview];
    QCommandManager *commandManager = [QBallCommandManager shareCommandManager];
    NSInteger endIndex   = [commandManager queueCount] + CBUTTON_BASE - 1;

    UIView *rView =     (UIView *)[[QUIManager shareUIManager] obtainUI:@"Right"];
    [[[rView viewWithTag:7000] viewWithTag:7001] removeFromSuperview];

    [commandManager removeCommandWithName:cButton.commandName withIndex:cButton.cIndex];
     UIView *removeView = [sender superview];
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    positionAnimation.fromValue = [NSValue valueWithCGRect:cButton.frame];
    positionAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(cButton.center.x, cButton.center.y, 0, 0)];
    positionAnimation.springBounciness = 15.0f;
    positionAnimation.springSpeed = 30.0f;
    
    positionAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished)
    {
        if (finished)
        {
            
            for (NSInteger i = 1000; i <= endIndex; i++)
            {
                POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
                
                CommandButton *ajustView = (CommandButton *)[stateView viewWithTag:i];
                if (ajustView.cIndex <= cButton.cIndex) {
                    continue;
                }
                
                CGPoint point = ajustView.center;
                
                ((CommandButton *)ajustView).cIndex =  ((CommandButton *)ajustView).cIndex - 1;
                springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(point.x, point.y - 80)];
                springAnimation.springBounciness = 20.0;
                springAnimation.springSpeed = 20.0;
                [ajustView pop_addAnimation:springAnimation forKey:@"changeposition"];
                
            }
            
            for (NSInteger i = 1000; i <= endIndex; i++)
            {
                CommandButton *ajustView = (CommandButton *)[stateView viewWithTag:i];
                if (ajustView.tag > cButton.tag)
                            ajustView.tag = ajustView.tag - 1;

            }
            
            [removeView removeFromSuperview];
            
        }
    };

    
    /*positionAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished)
    {
        if (finished)
        {
            
            for (NSInteger i = beginIndex + 1; i <= endIndex; i++)
            {
                POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
                
                UIView *ajustView = [stateView viewWithTag:i];
                CGPoint point = ajustView.center;
                

                ajustView.tag = ajustView.tag - 1;
                ((CommandButton *)ajustView).cIndex =  ((CommandButton *)ajustView).cIndex - 1;
                springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(point.x, point.y - 80)];
                springAnimation.springBounciness = 20.0;
                springAnimation.springSpeed = 20.0;
                [ajustView pop_addAnimation:springAnimation forKey:@"changeposition"];

                //ajustView.frame   = CGRectMake(ajustView.frame.origin.x, ajustView.frame.origin.y - 80, ajustView.frame.size.width, ajustView.frame.size.height);
                //[ajustView startFAAnimation];
            }
            
            [removeView removeFromSuperview];

        }
    };*/
    [removeView pop_addAnimation:positionAnimation forKey:@"aaaa"];
    
}

- (void)commandSelected:(UILongPressGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        [QBallCommandManager shareCommandManager].selectedCommand = ((CommandButton *)gesture.view).cIndex;
        QUIStateManager *sManager = [QUIStateManager shareUIStateManager];
        
        if (sManager.middleTouchState == 1)
        {
            [[[stateView viewWithTag:sManager.middleSelelctedButton] viewWithTag:9000] removeFromSuperview];
            [stateView viewWithTag:sManager.middleSelelctedButton].alpha = 1.0;
        }
            
        sManager.middleTouchState = 1;
        sManager.middleSelelctedButton      =  gesture.view.tag;
        
        
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
        scaleAnimation.duration = 0.5;
        scaleAnimation.toValue = @0.5;
        
        
        UIImage *cancelImage     = [UIImage imageNamed:@"彩条取消图标.png"];
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelButton.frame     = CGRectMake(550, 18, 20, 20);
        cancelButton.tag       = 9000;
        [cancelButton setImage:cancelImage forState:UIControlStateNormal];
        
        [cancelButton addTarget:self action:@selector(deleteSelected:) forControlEvents:UIControlEventTouchUpInside];
        
        [gesture.view addSubview:cancelButton];

        
        [gesture.view pop_addAnimation:scaleAnimation forKey:@"changesize"];
    
    }

}

- (void)commandTouched:(id)sender
{
    
    
    [MusicEffectPlay playMusicWithFileName:@"加分"];

    QUIStateManager *sManager = [QUIStateManager shareUIStateManager];
    sManager.middleTouchState = 0;
    [stateView viewWithTag:sManager.middleSelelctedButton].alpha = 1;
    [[[stateView viewWithTag:sManager.middleSelelctedButton] viewWithTag:9000] removeFromSuperview];
    CommandButton *button = (CommandButton *)sender;
    [QBallCommandManager shareCommandManager].selectedCommand = button.cIndex;
    
    sManager.chageParamButton = ((CommandButton *)sender).tag;
        
    QUIMessage *message = [[QUIManager shareUIManager] genMessageType:button.commandName withIntValue:0 withType:0 withDName:@"NO"];
    
    id<QUi> rUpdateUi = [[QUIManager shareUIManager] obtainUI:@"Right"];
    [rUpdateUi updateUI:message];

}

- (void)programmeSelected:(id)sender
{
    ProgrammeButton *pButton = (ProgrammeButton *)sender;
    QCommandManager *ballManager =  [QBallCommandManager shareCommandManager];
    [ballManager clearAllCommand];
    NSArray *commandArray = pButton.commandArray;
    
    for (NSString *commandString in commandArray)
    {
        NSArray *paramArray = [commandString componentsSeparatedByString:@"&"];
        id<QCommand> command = [[NSClassFromString([paramArray objectAtIndex:0]) alloc] initWithAuto:nil];
        
        for (int i = 1; i < paramArray.count; i++)
        {
            NSNumber *p1 = [NSNumber numberWithFloat:[paramArray[i] floatValue]];
            [command.p setObject:p1 forKey:[NSNumber numberWithInt:i - 1]];
            
            
        }
        [ballManager addCommandToQueue:command];

    }
    
    [QUIStateManager shareUIStateManager].stateOperator = BALLALTER;
    [ProgrammeBallManager shareProgrammeManager].selectedProgramme =  pButton.indexFile;
    [self allChangeToProgramme];

    
    
}

- (void)swipeDel:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft)
    {
         UIImage *cancelImage     = [UIImage imageNamed:@"彩条取消图标.png"];
         UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
         cancelButton.frame     = CGRectMake(550, 18, 20, 20);
         [cancelButton setImage:cancelImage forState:UIControlStateNormal];
         
         [cancelButton addTarget:self action:@selector(deleteSelected:) forControlEvents:UIControlEventTouchUpInside];
         
         [sender.view addSubview:cancelButton];

    }
}


#pragma mark -
#pragma mark programme area






@end

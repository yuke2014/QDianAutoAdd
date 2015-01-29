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
    NSInteger beginIndex = cButton.tag;

    [commandManager removeCommandWithName:cButton.commandName withIndex:cButton.cIndex];
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
    /*UIImage *cancelImage     = [UIImage imageNamed:@"彩条取消图标.png"];
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame     = CGRectMake(550, 18, 20, 20);
    [cancelButton setImage:cancelImage forState:UIControlStateNormal];
    
    [cancelButton addTarget:self action:@selector(deleteSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [gesture.view addSubview:cancelButton];*/
    
    QUIStateManager *sManager = [QUIStateManager shareUIStateManager];

    sManager.middleTouchState = 1;
    sManager.middleSelelctedButton      =  gesture.view.tag;
    
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    
    CGSize s = gesture.view.frame.size;

    springAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(s.width * 1.2, s.height * 1.2)];
    springAnimation.springBounciness = 20.0;
    springAnimation.springSpeed = 20.0;
    
    [gesture.view.layer pop_addAnimation:springAnimation forKey:@"changesize"];
    
    

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


#pragma mark -
#pragma mark programme area






@end

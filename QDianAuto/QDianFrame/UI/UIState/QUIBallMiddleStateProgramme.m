//
//  QUIBallMiddleStateProgramme.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/19.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUIBallMiddleStateProgramme.h"
#import "QUIModalManager.h"
#import "QUIConfig.h"
#import "CommandButton.h"
#import "UIView+FastAnimation.h"
#import "QUIStateManager.h"
#import "POP/POP.h"




@implementation QUIBallMiddleStateProgramme
@synthesize stateName;

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]) != nil)
    {
        middleModal = [[QUIModalManager shareModalManager] createMiddleModal];
        middleModal.stateView = self;
        self.userInteractionEnabled = YES;
        isAnimationRun = NO;
        
    }
    
    return self;
}


- (void)loadUI:(UIView *)fView
{
//    float     flagWidth    = 90;
//    float     flagHeight   = 90;
    float     controlPos   = 0;
    float     leftMargin   = 34;
    
    UILabel *centerLabel = [[UILabel alloc] initWithFrame:CGRectMake(320, 35, 120, 24)];
    centerLabel.font = [UIFont systemFontOfSize:22];
    centerLabel.textColor = [UIColor whiteColor];
    centerLabel.text = @"指令区";
    [self addSubview:centerLabel];
    
    
    controlPos+=80;
    
    
    UIImageView *sepLine = [[UIImageView alloc] initWithFrame:CGRectMake(leftMargin,controlPos , 648.0, 2.0)];
    sepLine.image = [UIImage imageNamed:@"中间指令分割线.png"];
    [self addSubview:sepLine];
    [fView addSubview:self];
    
    if ([QUIStateManager shareUIStateManager].stateOperator == BALLALTER)
    {
        QCommandManager *ballManager = [QBallCommandManager shareCommandManager];
        NSInteger qCount = [ballManager queueCount];
        NSDictionary *pDic = [ballManager obtainParamConfig];
        
        for (int i = 0; i < qCount; i++)
        {
            id<QCommand> c = [ballManager obtainCommandWithIndex:i];
            NSString *className = NSStringFromClass([c class]);
            NSDictionary *dName     = [pDic objectForKey:className];
            QUIMessage *message = [[QUIManager shareUIManager] genMessageType:className withIntValue:qCount withType:i withDName:[dName objectForKey:@"name"]];
            [self updateUI:message];
            
        }
        
    }

}

- (void)updateUI:(id)message
{
    QUIMessage *sMessage = (QUIMessage *)message;
    
    
    if ([QUIStateManager shareUIStateManager].stateOperator != BALLADD)
    {
        UILabel *centerLabel = [[UILabel alloc] initWithFrame:CGRectMake(400, 35, 180, 24)];
        centerLabel.font = [UIFont systemFontOfSize:20];
        centerLabel.textColor = [UIColor whiteColor];
        centerLabel.text = [NSString stringWithFormat:@"(当前程序:%@)",[ProgrammeBallManager shareProgrammeManager].selectedProgrammeName];
        [self addSubview:centerLabel];

    }
    
    
    
    float beginPos = 110;
    beginPos = beginPos + sMessage.mType * 80;
    
    if (beginPos > self.frame.size.height) {
        self.contentSize = CGSizeMake(self.frame.size.width, beginPos + 80);
    }

    
    int flagIndex = (arc4random() % 4) + 7;
    
    
    UIImage *buttonImage = [UIImage imageNamed:[NSString stringWithFormat:@"彩条%d",flagIndex]];
    
    CommandButton *cButton = [CommandButton buttonWithType:UIButtonTypeCustom];
    cButton.frame = CGRectMake(60, beginPos, 580.0, 56.0);
    cButton.commandName = sMessage.mName;
    cButton.cIndex      = sMessage.mType;
    cButton.tag         = CBUTTON_BASE + cButton.cIndex;
    
    NSString *cName = [[QBallCommandManager shareCommandManager] genButtonDisplay:cButton.cIndex];
    NSString *dName = [NSString stringWithFormat:@"%@(%@)",sMessage.dName,cName];
    
    [cButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -buttonImage.size.width, 0.0, 0.0)];
    [cButton setImage:buttonImage forState:UIControlStateNormal];
    [cButton setTitle:dName forState:UIControlStateNormal];
    [cButton setImageEdgeInsets:UIEdgeInsetsMake(2.0, 0.0, 0.0, -cButton.titleLabel.bounds.size.width)];
   
    [cButton addTarget:middleModal action:@selector(commandTouched:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UILongPressGestureRecognizer *lPress = [[UILongPressGestureRecognizer alloc] initWithTarget:middleModal   action:@selector(commandSelected:)];
    [cButton addGestureRecognizer:lPress];
    

    
    UIPanGestureRecognizer *pGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragButton:)];
    [cButton addGestureRecognizer:pGesture];
    
    cButton.animationType = @"BounceRight";
    cButton.animationParams[@"springBounciness"] = @16;
    [self addSubview:cButton];
    [cButton startFAAnimation];
    
    

}

- (void)test:(id)sender
{
    NSLog(@"swipe is running.......");
}

#pragma mark -
#pragma mark 拖拽调整顺序

- (void)dragButton:(UIPanGestureRecognizer *)gesture
{
    QUIStateManager *sManager = [QUIStateManager shareUIStateManager];

    if (sManager.middleTouchState == 1 && gesture.view.tag == sManager.middleSelelctedButton)
    {

        switch (gesture.state)
        {
            case UIGestureRecognizerStateBegan:
            {
                [self dragBegin:gesture];
            }
            break;
            case UIGestureRecognizerStateChanged:
            {
                [self dragMove:gesture];
            }
            break;
            case UIGestureRecognizerStateEnded:
            {
                [self dragEnd:gesture];
            }
            break;
            default:
                break;
        }
    }
}

- (void)dragBegin:(UIPanGestureRecognizer *)gesture
{
    QUIStateManager *sManager = [QUIStateManager shareUIStateManager];
    UIView *selectedView = [self viewWithTag:sManager.middleSelelctedButton];
    self.srcRect = selectedView.frame;
    self.dstRect = selectedView.frame;

}

- (void)dragMove:(UIPanGestureRecognizer *)gesture
{
    QUIStateManager *sManager = [QUIStateManager shareUIStateManager];
    CommandButton *selectedView = (CommandButton *)[self viewWithTag:sManager.middleSelelctedButton];
    selectedView.center = [gesture locationInView:self];
    [self checkButtonMove:selectedView];
    

}

- (void)dragEnd:(UIPanGestureRecognizer *)gesture
{
    QUIStateManager *sManager = [QUIStateManager shareUIStateManager];
    sManager.middleTouchState = 0;
    
    UIView *selectedView = [self viewWithTag:sManager.middleSelelctedButton];
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    
    springAnimation.toValue = [NSValue valueWithCGRect:self.dstRect];
    springAnimation.springBounciness = 20.0;
    springAnimation.springSpeed = 20.0;
    
    [selectedView pop_addAnimation:springAnimation forKey:@"back"];
    //selectedView.frame = self.dstRect;
    selectedView.alpha = 1.0;
    
    QCommandManager *ballManager = [QBallCommandManager shareCommandManager];

    ballManager.selectedCommand = ((CommandButton *)gesture.view).cIndex;
    [[selectedView viewWithTag:9000] removeFromSuperview];
    
    //((CommandButton *)selectedView).isMove = NO;
    

}




- (void)checkButtonMove:(CommandButton *)moveButton
{
    QCommandManager *ballManager = [QBallCommandManager shareCommandManager];
    NSInteger buttonCount = [ballManager queueCount];
    
    for (int i = 0 ; i < buttonCount; i++)
    {
            CommandButton *cButton = (CommandButton *)[self viewWithTag:CBUTTON_BASE + i];
        if (cButton.tag != moveButton.tag)
        {

        
            CGRect iRect = CGRectIntersection(cButton.frame, moveButton.frame);
            
            if ((iRect.size.height > (moveButton.frame.size.height / 2)) && !isAnimationRun)
            {
                isAnimationRun = YES;
                self.dstRect = cButton.frame;

                POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
                
                
                springAnimation.toValue = [NSValue valueWithCGRect:self.srcRect];
                springAnimation.springBounciness = 10.0;
                springAnimation.springSpeed = 20.0;
                springAnimation.completionBlock =  ^(POPAnimation *anim, BOOL finished){
                    self.srcRect = self.dstRect;
                    isAnimationRun = NO;
                };
                [cButton pop_addAnimation:springAnimation forKey:@"ButtonSrc"];
                                
                [[ballManager queue] exchangeObjectAtIndex:moveButton.cIndex withObjectAtIndex:cButton.cIndex];
                
                NSInteger temp    = moveButton.cIndex;
                moveButton.cIndex = cButton.cIndex;
                cButton.cIndex    = temp;
                
                
                
            }
        }
    }
}








@end

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


@implementation QUIBallMiddleStateProgramme
@synthesize stateName;

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]) != nil)
    {
        middleModal = [[QUIModalManager shareModalManager] createMiddleModal];
        middleModal.stateView = self;
        self.userInteractionEnabled = YES;
    }
    
    return self;
}

- (void)loadUI:(UIView *)fView
{
    float     flagWidth    = 90;
    float     flagHeight   = 90;
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
    NSInteger messageCount = sMessage.mLen;
    
    
    float beginPos = 110;
//    if ([QUIStateManager shareUIStateManager].stateOperator == BALLADD)
//    {
//        beginPos = beginPos + (messageCount - 1) * 80;
//    }
//    else
//    {
        beginPos = beginPos + sMessage.mType * 80;

    //}
    
    int flagIndex = (arc4random() % 6) + 1;
    
    
    UIImage *buttonImage = [UIImage imageNamed:[NSString stringWithFormat:@"彩条%d",flagIndex]];
    
    CommandButton *cButton = [CommandButton buttonWithType:UIButtonTypeCustom];
    cButton.frame = CGRectMake(60, beginPos, 580.0, 56.0);
    cButton.commandName = sMessage.mName;
    cButton.cIndex      = sMessage.mType;
    cButton.tag         = CBUTTON_BASE + cButton.cIndex;
    
    [cButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -buttonImage.size.width, 0.0, 0.0)];
    [cButton setImage:buttonImage forState:UIControlStateNormal];
    [cButton setTitle:sMessage.dName forState:UIControlStateNormal];
    [cButton setImageEdgeInsets:UIEdgeInsetsMake(2.0, 0.0, 0.0, -cButton.titleLabel.bounds.size.width)];
   
    [cButton addTarget:middleModal action:@selector(commandTouched:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UILongPressGestureRecognizer *lPress = [[UILongPressGestureRecognizer alloc] initWithTarget:middleModal   action:@selector(commandSelected:)];
    [cButton addGestureRecognizer:lPress];
    
    cButton.animationType = @"BounceRight";
    cButton.animationParams[@"springBounciness"] = @16;
    [self addSubview:cButton];
    [cButton startFAAnimation];
    
    

}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    QUIStateManager *sManager = [QUIStateManager shareUIStateManager];
    UIView *selectedView = [self viewWithTag:sManager.middleSelelctedButton];
    self.srcRect = selectedView.frame;
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    QUIStateManager *sManager = [QUIStateManager shareUIStateManager];
    if (sManager.middleTouchState == 1)
    {
        UITouch *touch = [touches anyObject];
        UIView *selectedView = [self viewWithTag:sManager.middleSelelctedButton];
        selectedView.center = [touch locationInView:self];
        [self checkButtonMove:selectedView];
    }
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    QUIStateManager *sManager = [QUIStateManager shareUIStateManager];
    sManager.middleTouchState = 0;
    
    UIView *selectedView = [self viewWithTag:sManager.middleSelelctedButton];
    selectedView.frame = self.dstRect;
    
    

}

- (void)checkButtonMove:(CommandButton *)moveButton
{
    QCommandManager *ballManager = [QBallCommandManager shareCommandManager];
    NSInteger buttonCount = [ballManager queueCount];
    NSLog(@"moveButton frame is : %@",NSStringFromCGRect(moveButton.frame));
    
    for (int i = 0 ; i < buttonCount; i++)
    {
        if (i != ballManager.selectedCommand)
        {
            CommandButton *cButton = (CommandButton *)[self viewWithTag:CBUTTON_BASE + i];
        
            CGRect iRect = CGRectIntersection(cButton.frame, moveButton.frame);
            
            if (iRect.size.height > (moveButton.frame.size.height / 2))
            {
                    self.dstRect = cButton.frame;
                    cButton.frame = self.srcRect;
                    self.srcRect = self.dstRect;
            }
        }
    }
}






@end

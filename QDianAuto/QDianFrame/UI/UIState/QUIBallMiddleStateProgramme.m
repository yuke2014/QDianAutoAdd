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


@implementation QUIBallMiddleStateProgramme
@synthesize stateName;

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]) != nil)
    {
        middleModal = [[QUIModalManager shareModalManager] createMiddleModal];
        middleModal.stateView = self;
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

}

- (void)updateUI:(id)message
{
    QUIMessage *sMessage = (QUIMessage *)message;
    NSInteger messageCount = sMessage.mLen;
    
    
    float beginPos = 110;
    beginPos = beginPos + (messageCount - 1) * 80;
    
    int flagIndex = (arc4random() % 6) + 1;
    
    
    UIImage *buttonImage = [UIImage imageNamed:[NSString stringWithFormat:@"彩条%d",flagIndex]];
    
    CommandButton *cButton = [CommandButton buttonWithType:UIButtonTypeCustom];
    cButton.frame = CGRectMake(60, beginPos, 580.0, 56.0);
    cButton.commandName = sMessage.mName;
    cButton.cIndex      = messageCount - 1;
    [cButton setImage:buttonImage forState:UIControlStateNormal];
    [cButton addTarget:middleModal action:@selector(commandSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    UILongPressGestureRecognizer *lPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(editPress:)];
    [cButton addGestureRecognizer:lPress];
    
    cButton.animationType = @"BounceRight";
    cButton.animationParams[@"springBounciness"] = @16;
    [self addSubview:cButton];
    [cButton startFAAnimation];

}

- (void)editPress:(UILongPressGestureRecognizer *)gesture
{
    UIImage *cancelImage     = [UIImage imageNamed:@"彩条取消图标.png"];
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame     = CGRectMake(550, 15, 20, 20);
    [cancelButton setImage:cancelImage forState:UIControlStateNormal];
    
    [cancelButton addTarget:middleModal action:@selector(carCodeSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [gesture.view addSubview:cancelButton];

}



@end

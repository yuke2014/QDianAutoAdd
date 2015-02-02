//
//  QUIWelcomState.m
//  QDianAuto
//
//  Created by cuiyk on 15/2/1.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUIWelcomState.h"

@implementation QUIWelcomState
@synthesize  stateName;

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]) != nil)
    {
    }
    
    return self;
}


- (void)loadUI:(UIView *)fView
{
    float     flagWidth    = 80;
    float     flagHeight   = 80;
    float     controlPos   = 0;
    float     leftMargin   = 34;

    
    UILabel *centerLabel = [[UILabel alloc] initWithFrame:CGRectMake(260, 35, 180, 24)];
    centerLabel.font = [UIFont systemFontOfSize:23];
    centerLabel.textColor = [UIColor whiteColor];
    centerLabel.text = @"欢迎来到奇点号!";
    [self addSubview:centerLabel];
    
    
    controlPos+=80;
    
    UIImageView *sepLine = [[UIImageView alloc] initWithFrame:CGRectMake(leftMargin,controlPos , 648.0, 2.0)];
    sepLine.image = [UIImage imageNamed:@"中间指令分割线.png"];
    [self addSubview:sepLine];
    
    controlPos += 50;
    
//    欢迎来到奇点号
//    
//    在这里，我们用最酷的玩法编程
//    在这里，我们以最high方式学习
//    奇点号，点燃你的科技梦想
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, controlPos, 500, 400)];
    contentLabel.font = [UIFont systemFontOfSize:24];
    contentLabel.textColor = [UIColor whiteColor];
    contentLabel.numberOfLines = 5;
    contentLabel.text = @"在这里，我们用最酷的玩法编程\n\n在这里，我们以最high方式学习\n\n奇点号，点燃你的科技梦想";
    [self addSubview:contentLabel];

    
    
    [fView addSubview:self];
    
}




- (void)updateUI:(id)message
{
    
}

@end

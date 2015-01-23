//
//  QUIBallMiddleStateNormal.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/15.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUIBallMiddleStateNormal.h"

@implementation QUIBallMiddleStateNormal
@synthesize stateName;


- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]) != nil)
    {
        middleModal = [[QUIModalManager shareModalManager] createMiddleModal];
    }
    
    return self;
}



- (void)loadUI:(UIView *)fView
{
    
    float     flagWidth    = 80;
    float     flagHeight   = 80;
    float     controlPos   = 0;
    float     leftMargin   = 34;
    
    UILabel *centerLabel = [[UILabel alloc] initWithFrame:CGRectMake(320, 35, 120, 24)];
    centerLabel.font = [UIFont systemFontOfSize:22];
    centerLabel.textColor = [UIColor whiteColor];
    centerLabel.text = @"太空球程序";
    [self addSubview:centerLabel];
    
    
    controlPos+=80;
    
    UIImageView *sepLine = [[UIImageView alloc] initWithFrame:CGRectMake(leftMargin,controlPos , 648.0, 2.0)];
    sepLine.image = [UIImage imageNamed:@"中间指令分割线.png"];
    [self addSubview:sepLine];
    
    controlPos+=60;
    
    UIImage *ballImage     = [UIImage imageNamed:@"添加.png"];
    UIButton *ballButton = [UIButton buttonWithType:UIButtonTypeCustom];
    ballButton.frame     = CGRectMake(leftMargin, controlPos, flagWidth, flagHeight);
    [ballButton setImage:ballImage forState:UIControlStateNormal];
    
    [ballButton addTarget:middleModal action:@selector(carCodeSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:ballButton];
    [fView addSubview:self];

}

- (void)updateUI:(id)message
{
    
}

@end

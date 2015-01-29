//
//  QUILeftStateNormal.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/15.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUIBallLeftStateNormal.h"
#import "QUIConfig.h"

@implementation QUIBallLeftStateNormal
@synthesize stateName;


- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]) != nil)
    {
        leftModal = [[QUIModalManager shareModalManager] createLeftModal];
    }
    
    return self;
}


- (void)loadUI:(UIView *)fView
{
    float     flagWidth    = 40;
    float     flagHeight   = 40;
    float     controlPos   = 0;
    float     leftMargin   = 30;
    
    UIImageView *cockpitImage = [[UIImageView alloc] initWithFrame:CGRectMake(leftMargin+5, 0, 40, 40)];
    cockpitImage.image = [UIImage imageNamed:@"驾驶舱.png"];
    [self addSubview:cockpitImage];
    
    UILabel *cLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, 42, 80, 40)];
    cLabel.font = [UIFont systemFontOfSize:16];
    cLabel.textColor = [UIColor whiteColor];
    cLabel.text = @"驾驶舱";
    [self addSubview:cLabel];
    
    
    
    
    controlPos+=150;
    
    
    UIImage *ballImage     = [UIImage imageNamed:@"太空球.png"];
    UIImage *ballHighlight = [UIImage imageNamed:@"太空球选中按下.png"];
    UIButton *ballButton = [UIButton buttonWithType:UIButtonTypeCustom];
    ballButton.frame     = CGRectMake(leftMargin+5, controlPos, flagWidth, flagHeight);
    [ballButton setImage:ballImage forState:UIControlStateNormal];
    [ballButton setImage:ballHighlight forState:UIControlStateHighlighted];
    
    [ballButton addTarget:leftModal action:@selector(ballAction:) forControlEvents:UIControlEventTouchUpInside];
    
    controlPos+= 40;
    UILabel *ballLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, controlPos, 80, 40)];
    ballLabel.font = [UIFont systemFontOfSize:16];
    ballLabel.textColor = [UIColor whiteColor];
    ballLabel.text = @"太空球";
    [self addSubview:ballLabel];

    
    
    controlPos+=130;
    
    UIImage *carImage     = [UIImage imageNamed:@"太空车.png"];
    UIImage *carHighlight = [UIImage imageNamed:@"太空车选中按下.png"];
    UIButton *carButton = [UIButton buttonWithType:UIButtonTypeCustom];
    carButton.frame     = CGRectMake(leftMargin+5, controlPos, flagWidth, flagHeight);
    [carButton setImage:carImage forState:UIControlStateNormal];
    [carButton setImage:carHighlight forState:UIControlStateHighlighted];
    [carButton addTarget:leftModal action:@selector(carAction:) forControlEvents:UIControlEventTouchUpInside];
    
    controlPos+=40;
    UILabel *carLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, controlPos, 80, 40)];
    carLabel.font = [UIFont systemFontOfSize:16];
    carLabel.textColor = [UIColor whiteColor];
    carLabel.text = @"太空车";
    [self addSubview:carLabel];

    
    
    [self addSubview:ballButton];
    [self addSubview:carButton];
    
    [fView addSubview:self];

}




- (void)updateUI:(id)message
{
    
}

@end

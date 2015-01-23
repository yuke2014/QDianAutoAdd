//
//  QUITopBarState.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/20.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUITopBarState.h"

@implementation QUITopBarState
@synthesize stateName;

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]) != nil)
    {
    }
    
    return self;
}


- (void)loadUI:(UIView *)fView
{
    UIImageView *backView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 1024.0, 44.0)];
    backView.image = [UIImage imageNamed:@"01topbar.png"];
    [self addSubview:backView];
    
    UILabel *centerLabel = [[UILabel alloc] initWithFrame:CGRectMake(460, 5, 120, 30)];
    centerLabel.font = [UIFont systemFontOfSize:20];
    centerLabel.textColor = [UIColor whiteColor];
    centerLabel.text = @"奇点号";
    [self addSubview:centerLabel];
    
    
    UIImage *settingImage     = [UIImage imageNamed:@"设置.png"];
    UIImage *settingHightLighted     = [UIImage imageNamed:@"设置按下.png"];
    
    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    settingButton.frame     = CGRectMake(980, 11, 22, 22);
    [settingButton setImage:settingImage forState:UIControlStateNormal];
    [settingButton setImage:settingHightLighted forState:UIControlStateHighlighted];
    //[settingButton addTarget:middleModal action:@selector(carCodeSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:settingButton];
    
    
    [fView addSubview:self];

    
}
- (void)updateUI:(id)message
{
    
}


@end

//
//  QUITopBarStateSetting.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/21.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUITopBarStateSetting.h"
#import "QUITopModal.h"

@implementation QUITopBarStateSetting
@synthesize stateName;

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]) != nil)
    {
        topModal = [[QUITopModal alloc] init];
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
    
    UIImage *backImage     = [UIImage imageNamed:@"返回.png"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame     = CGRectMake(5, 11, 18, 18);
    [backButton setImage:backImage forState:UIControlStateNormal];
    [self addSubview:backButton];
    
    UIImage *playImage     = [UIImage imageNamed:@"开始.png"];
    UIImage *playHightLighted     = [UIImage imageNamed:@"开始按下.png"];
    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    playButton.frame     = CGRectMake(830, 11, 22, 22);
    [playButton setImage:playImage forState:UIControlStateNormal];
    [playButton setImage:playHightLighted forState:UIControlStateHighlighted];
    [playButton addTarget:topModal action:@selector(playButtonDown:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:playButton];
    
    
    UIImage *pauseImage     = [UIImage imageNamed:@"暂停.png"];
    UIImage *pauseHightLighted     = [UIImage imageNamed:@"暂停按下.png"];
    UIButton *pauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pauseButton.frame     = CGRectMake(880, 11, 22, 22);
    [pauseButton setImage:pauseImage forState:UIControlStateNormal];
    [pauseButton setImage:pauseHightLighted forState:UIControlStateHighlighted];
    [self addSubview:pauseButton];
    
    UIImage *lockImage     = [UIImage imageNamed:@"锁定.png"];
    UIImage *lockHightLighted     = [UIImage imageNamed:@"锁定按下.png"];
    UIButton *lockButton = [UIButton buttonWithType:UIButtonTypeCustom];
    lockButton.frame     = CGRectMake(930, 11, 22, 22);
    [lockButton setImage:lockImage forState:UIControlStateNormal];
    [lockButton setImage:lockHightLighted forState:UIControlStateHighlighted];
    [self addSubview:lockButton];

    
    UIImage *settingImage     = [UIImage imageNamed:@"设置.png"];
    UIImage *settingHightLighted     = [UIImage imageNamed:@"设置按下.png"];
    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    settingButton.frame     = CGRectMake(980, 11, 22, 22);
    [settingButton setImage:settingImage forState:UIControlStateNormal];
    [settingButton setImage:settingHightLighted forState:UIControlStateHighlighted];
    [self addSubview:settingButton];
    
    
    [fView addSubview:self];
    
    
}
- (void)updateUI:(id)message
{
    
}


@end

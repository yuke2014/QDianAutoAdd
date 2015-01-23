//
//  QUIRightStateProgramme.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/20.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUIBallRightStateProgramme.h"
#import "QUIMessage.h"

@implementation QUIBallRightStateProgramme
@synthesize stateName;

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]) != nil)
    {
        NSString *pListPath = [[NSBundle mainBundle] pathForResource:@"BallCommandDes" ofType:@"plist"];
        paramConfig    = [[NSMutableDictionary alloc] initWithContentsOfFile:pListPath];
    }
    
    return self;
}

- (void)loadUI:(UIView *)fView
{
//    float     flagWidth    = 90;
//    float     flagHeight   = 90;
    float     controlPos   = 5;
    float     leftMargin   = 10;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 230, 400)];
    imageView.image = [UIImage imageNamed:@"指令区圆角黑色透明底.png"];
    [self addSubview:imageView];
    
    UILabel *centerLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, controlPos, 80, 40)];
    centerLabel.font = [UIFont systemFontOfSize:16];
    centerLabel.textColor = [UIColor whiteColor];
    centerLabel.text = @"功能参数";
    [self addSubview:centerLabel];
    
    
    controlPos+=45;
    
    UIImageView *sepLine = [[UIImageView alloc] initWithFrame:CGRectMake(leftMargin,controlPos , 195.0, 1.0)];
    sepLine.image = [UIImage imageNamed:@"中间指令分割线.png"];
    [self addSubview:sepLine];
    
    [fView addSubview:self];
    
}

- (void)updateUI:(id)message
{
    [paramView removeFromSuperview];
    paramView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 48.0, 230.0, 400.0)];
    
    float controlPos = 0.0;
    float     leftMargin   = 10;
    
    QUIMessage *rMessage = (QUIMessage *)message;
    
    NSDictionary *pDic = [paramConfig objectForKey:rMessage.mName];
    NSArray *pList     = [pDic objectForKey:@"param"];
    
    for (NSString *p in pList)
    {
        UILabel *fLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, controlPos, 80, 40)];
        fLabel.font = [UIFont systemFontOfSize:15];
        fLabel.textColor = [UIColor whiteColor];
        fLabel.text = p;
        [paramView addSubview:fLabel];
        
        controlPos+=42;
        UISlider *fSlider = [[UISlider alloc] initWithFrame:CGRectMake(leftMargin, controlPos, 180, 15)];
        fSlider.minimumValue = 0.0;
        fSlider.maximumValue = 1.0;
        [paramView addSubview:fSlider];
        
        controlPos+=12;
    }
    
    
    [self addSubview:paramView];
    
    
    

}


@end

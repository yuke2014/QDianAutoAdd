//
//  QUIBallMiddleStateNormal.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/15.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUIBallMiddleStateNormal.h"
#import "ProgrammeButton.h"




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
    NSComparator cmptr = ^(id obj1, id obj2){
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    };
    
    NSDictionary *commandDic = [[ProgrammeBallManager shareProgrammeManager] loadAllProgrammerFromPath];
    NSArray *fileName = [commandDic allKeys];
    NSArray  *fileNameOrder =  [fileName sortedArrayUsingComparator:cmptr];
    
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
    
    UIImage *pBallImage     = [UIImage imageNamed:@"太空球.png"];

    for (int i = 0; i < fileNameOrder.count; i++)
    {

        ProgrammeButton *pButton = [ProgrammeButton buttonWithType:UIButtonTypeCustom];
        pButton.frame = CGRectMake(leftMargin + ((i+1) * flagWidth+50), controlPos + 15, 50, 50);
    
        [pButton setImage:pBallImage forState:UIControlStateNormal];
        pButton.commandString = [commandDic objectForKey:[fileNameOrder objectAtIndex:i]];
        [self addSubview:pButton];
    }
    
    
    [fView addSubview:self];

}

- (void)updateUI:(id)message
{
    
}

@end

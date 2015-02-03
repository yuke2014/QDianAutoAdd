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
    
    [ballButton addTarget:middleModal action:@selector(addCodeSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:ballButton];
    
    UIImage *pBallImage     = [UIImage imageNamed:@"太空球.png"];
    
    NSInteger fRow = 0;
    NSInteger sRow = 0;
    
    if (fileNameOrder.count <= 4)
    {
        fRow = fileNameOrder.count;
    }
    else
    {
        fRow = 4;
        sRow = fileNameOrder.count - 5;
    }
    
    int pIndex = 0;

    for (int i = 0; i < fRow; i++)
    {

        ProgrammeButton *pButton = [ProgrammeButton buttonWithType:UIButtonTypeCustom];
        pButton.frame = CGRectMake(leftMargin + ((i+1) * (flagWidth+60)), controlPos + 15, 50, 50);
        
        [pButton setImage:pBallImage forState:UIControlStateNormal];
        pButton.commandArray = [commandDic objectForKey:[fileNameOrder objectAtIndex:i]];
        pButton.indexFile    = [fileNameOrder[i] integerValue];
        [pButton addTarget:middleModal action:@selector(programmeSelected:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *carLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin + ((i+1) * (flagWidth+60))+10, controlPos+10+50, 80, 40)];
        carLabel.font = [UIFont systemFontOfSize:16];
        carLabel.textColor = [UIColor whiteColor];
        carLabel.text =[ NSString stringWithFormat:@"P%d",pIndex ];
        pButton.pName = carLabel.text;
        [self addSubview:carLabel];
        [self addSubview:pButton];
        pIndex++;
    }
    

    
    for (int i = 0; i < sRow; i++)
    {
        ProgrammeButton *pButton = [ProgrammeButton buttonWithType:UIButtonTypeCustom];
        pButton.frame = CGRectMake(leftMargin + (i * (flagWidth+60)), controlPos + 10 + 110, 50, 50);
        
        [pButton setImage:pBallImage forState:UIControlStateNormal];
        pButton.commandArray = [commandDic objectForKey:[fileNameOrder objectAtIndex:i]];
        pButton.indexFile    = [fileNameOrder[i] integerValue];
        [pButton addTarget:middleModal action:@selector(programmeSelected:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *carLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin + (i * (flagWidth+60))+15,  controlPos + 15 + 110 + 40, 80, 40)];
        carLabel.font = [UIFont systemFontOfSize:16];
        carLabel.textColor = [UIColor whiteColor];
        carLabel.text =[ NSString stringWithFormat:@"P%d",pIndex ];
        pButton.pName = carLabel.text;

        [self addSubview:carLabel];
        [self addSubview:pButton];
        pIndex++;

        [self addSubview:pButton];

    }
    
    
    [fView addSubview:self];

}

- (void)updateUI:(id)message
{
    
}

@end

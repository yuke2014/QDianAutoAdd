//
//  QUIRightStateProgramme.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/20.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUIBallRightStateProgramme.h"
#import "QUIMessage.h"
#import "QUIManager.h"
#import "QBallCommandManager.h"
#import "CommandButton.h"
#import "QUIMiddle.h"

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
    
    UILabel *centerLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, controlPos, 220, 40)];
    centerLabel.font = [UIFont systemFontOfSize:16];
    centerLabel.textColor = [UIColor whiteColor];
    centerLabel.text = @"功能参数";
    centerLabel.tag  = 2010;
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
    paramView.tag = 7001;
    float controlPos = 0.0;
    float     leftMargin   = 10;
    
    QUIMessage *rMessage = (QUIMessage *)message;
    
    NSDictionary *pDic = [paramConfig objectForKey:rMessage.mName];
    NSArray *pList     = [pDic objectForKey:@"param"];
    
    QCommandManager *cManager = [QBallCommandManager shareCommandManager];
    id<QCommand> command = [cManager obtainSelectedCommand];
    
    UILabel *tLabel = (UILabel *)[self viewWithTag:2010];
    tLabel.text = [NSString stringWithFormat:@"%@(%@)",@"功能参数",[pDic objectForKey:@"name"]];
    
    
    NSInteger i = 0;
    for (NSString *p in pList)
    {
        NSArray *ajustArray = [p componentsSeparatedByString:@"&"];
        if (ajustArray.count < 3)
        {
            continue;
        }

        UILabel *fLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin+10, controlPos, 80, 40)];
        fLabel.font = [UIFont systemFontOfSize:15];
        fLabel.textColor = [UIColor whiteColor];
        fLabel.text = [ajustArray objectAtIndex:0];
        fLabel.tag  = 8000 + i;
        [paramView addSubview:fLabel];
        
        /*UILabel *vLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin+130, controlPos, 80, 40)];
        vLabel.font = [UIFont systemFontOfSize:15];
        vLabel.textColor = [UIColor whiteColor];
        vLabel.tag = CLABEL_BASE + i;
        vLabel.text = [[command.p objectForKey:[NSNumber numberWithInt:i]] stringValue];
        [paramView addSubview:vLabel];*/
        
        UITextField *vText = [[UITextField alloc] initWithFrame:CGRectMake(leftMargin+130, controlPos, 80, 40)];
        vText.font = [UIFont systemFontOfSize:15];
        vText.textColor = [UIColor whiteColor];
        vText.tag = CLABEL_BASE + i;
        vText.text = [NSString stringWithFormat:@"%.2f",[[command.p objectForKey:[NSNumber numberWithInteger:i]] floatValue]];
        vText.keyboardType = UIKeyboardTypeNumberPad;
        vText.returnKeyType = UIReturnKeyDone;
        vText.delegate = self;
        [paramView addSubview:vText];




        
        controlPos+=42;
        UISlider *fSlider = [[UISlider alloc] initWithFrame:CGRectMake(leftMargin, controlPos, 180, 15)];
        fSlider.minimumValue = [[ajustArray objectAtIndex:1] floatValue];
        fSlider.maximumValue = [[ajustArray objectAtIndex:2] floatValue];
        fSlider.tag = CSLIDER_BASE + i;
        fSlider.value = [[command.p objectForKey:[NSNumber numberWithInteger:i]] floatValue];
        [fSlider addTarget:self action:@selector(changeParam:) forControlEvents:UIControlEventValueChanged];
        [paramView addSubview:fSlider];
        
        controlPos+=12;
        i++;
    }
    
    paramView.animationType = @"ZoomInY";

    [self addSubview:paramView];
    [paramView startFAAnimation];
    
    
}

- (void)changeParam:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    NSInteger index  =  slider.tag - CSLIDER_BASE;
    NSInteger lTag   = index + CLABEL_BASE;
    
    UITextField *sLabel = (UITextField *)[paramView viewWithTag:lTag];
    sLabel.text = [NSString stringWithFormat:@"%.1f",slider.value];
    
    QCommandManager *cManager = [QBallCommandManager shareCommandManager];
    id<QCommand> command = [cManager obtainSelectedCommand];
    [command.p setObject:[NSNumber numberWithFloat:slider.value]  forKey:[NSNumber numberWithInteger:index]];
    
    NSString *cName = [[QBallCommandManager shareCommandManager] genButtonDisplay:cManager.selectedCommand];
    
    QUIMiddle *mUI = (QUIMiddle *)[[QUIManager shareUIManager] obtainUI:@"Middle"];
    CommandButton *cButton = (CommandButton *)[(UIView *)mUI.temp viewWithTag:[QUIStateManager shareUIStateManager].chageParamButton];
    
    
    NSDictionary *pDic = [paramConfig objectForKey:NSStringFromClass([command class])];

    NSString *dName = [NSString stringWithFormat:@"%@(%@)",[pDic objectForKey:@"name"],cName];
    
    
    [cButton setTitle:dName forState:UIControlStateNormal];

    
    
    
    
}

#pragma mark -
#pragma mark TextField Dlegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSInteger index  =  textField.tag - CLABEL_BASE;
    NSInteger sTag   =  index + CSLIDER_BASE;
    
    UISlider *sSlider = (UISlider *)[paramView viewWithTag:sTag];
    
    sSlider.value = [textField.text floatValue];
    
    textField.text = [NSString stringWithFormat:@"%.1f",([textField.text floatValue])];
    
    QCommandManager *cManager = [QBallCommandManager shareCommandManager];
    id<QCommand> command = [cManager obtainSelectedCommand];
    [command.p setObject:[NSNumber numberWithFloat:([textField.text floatValue])]  forKey:[NSNumber numberWithInteger:index]];
    
    [textField resignFirstResponder];
    
    NSString *cName = [[QBallCommandManager shareCommandManager] genButtonDisplay:cManager.selectedCommand];
    
    QUIMiddle *mUI = (QUIMiddle *)[[QUIManager shareUIManager] obtainUI:@"Middle"];
    CommandButton *cButton = (CommandButton *)[(UIView *)mUI.temp viewWithTag:[QUIStateManager shareUIStateManager].chageParamButton];
    
    NSDictionary *pDic = [paramConfig objectForKey:NSStringFromClass([command class])];

    NSString *dName = [NSString stringWithFormat:@"%@(%@)",[pDic objectForKey:@"name"],cName];
    
    
    [cButton setTitle:dName forState:UIControlStateNormal];


    return  YES;
}




@end

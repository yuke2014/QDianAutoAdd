//
//  ViewController.m
//  QDianAuto
//
//  Created by 崔宇科 on 15/1/10.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "ViewController.h"
#import "QUILeft.h"
#import "QUIMiddle.h"
#import "QUITopBar.h"
#import "QUIManager.h"
#import "QUIRight.h"
#import "ProgrammeBallManager.h"
#import "QCarCommandManager.h"
#import "QBallCommandManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger isLoad = [defaults integerForKey:@"isLoad"];
    if (isLoad == 0)
    {
        [[ProgrammeBallManager shareProgrammeManager] initPDir];
        [defaults setInteger:1 forKey:@"isLoad"];
    }
    
    

    NSLog(@"iphone 6 plus frame is :::::::: %@",NSStringFromCGRect([[UIScreen mainScreen] bounds]));
    
    //----------------------
    UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 1024.0, 768.0)];
    background.image = [UIImage imageNamed:@"背景.png"];

    
    
    id<QUi> left = [[QUILeft alloc] initWithFrame:CGRectMake(0.0, 80.0, 110, 680)];
    [left loadUI];
    
    id<QUi> middle = [[QUIMiddle alloc] initWithFrame:CGRectMake(122, 80.0, 685, 680)];
    [middle loadUI];
    
    id<QUi> topBar = [[QUITopBar alloc] initWithFrame:CGRectMake(0.0, 20.0, 1024, 44)];
    [topBar loadUI];
    
    id<QUi> right = [[QUIRight alloc] initWithFrame:CGRectMake(815.0, 80.0, 230.0, 400.0)];
    [right loadUI];
    
    
    [[QUIManager shareUIManager] registerUI:left withName:@"Left"];
    [[QUIManager shareUIManager] registerUI:middle withName:@"Middle"];
    [[QUIManager shareUIManager] registerUI:topBar withName:@"Top"];
    [[QUIManager shareUIManager] registerUI:right withName:@"Right"];
    
    
    
    [self.view addSubview:background];
    [self.view addSubview:(UIView *)left];
    [self.view addSubview:(UIView *)middle];
    [self.view addSubview:(UIView *)topBar];
    [self.view addSubview:(UIView *)right];
    

}

- (void)add:(id)sender
{
    NSLog(@"adsfadsfdsaf");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotateToInterfaceOrientation
{
    return YES;
}

-(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationLandscapeLeft;
}

@end

//
//  SettingViewConroller.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/31.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "SettingViewConroller.h"

@interface SettingViewConroller ()

@end

@implementation SettingViewConroller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createAimBtn];
    // Do any additional setup after loading the view from its nib.
}

//按钮：校准开始和结束
- (void)createAimBtn {
    
    CGRect frame = CGRectMake(200, 170, 150, 40);
    self.m_AimBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.m_AimBtn.frame = frame;
    [self.m_AimBtn setTitle:@"校准方向" forState:UIControlStateNormal];
    [self.m_AimBtn setTitle:@"校准 !!!" forState:UIControlStateHighlighted];
    [self.m_AimBtn addTarget:self
                      action:@selector(btnAimRobot:)
            forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.m_AimBtn];
}

-(void)btnAimRobot:(id)sender {
    
    if(1){//self.m_pSpheroManager.m_isAiming) {
        //1.当前正在校准，则关闭
        [self.m_AimBtn setTitle:@"开启校准方向" forState:UIControlStateNormal];
        [self.m_AimBtn setTitle:@"开启校准 !!!" forState:UIControlStateHighlighted];
    }
    else {
        //2.当前没有在校准，则开启校准
        [self.m_AimBtn setTitle:@"关闭校准方向" forState:UIControlStateNormal];
        [self.m_AimBtn setTitle:@"关闭校准 !!!" forState:UIControlStateHighlighted];
    }
    
    //[self.m_pSpheroManager start_or_stop_AimCalibrate];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

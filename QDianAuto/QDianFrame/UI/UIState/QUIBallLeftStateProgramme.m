//
//  QUILeftStateProgram.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/15.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUIBallLeftStateProgramme.h"

@implementation QUIBallLeftStateProgramme
@synthesize stateName;


//测试注释
- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]) != nil)
    {
        commonTableModal = (id<QUIModal,UITableViewDelegate,UITableViewDataSource>)[[QUIModalManager shareModalManager] createCommonTableModal];
    }
    
    return self;
}


- (void)loadUI:(UIView *)fView
{
    
    commandTable = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
    commandTable.backgroundColor = [UIColor clearColor];
    commandTable.separatorColor  = [UIColor clearColor];
    commandTable.delegate = commonTableModal;
    commandTable.dataSource = commonTableModal;
    
    
    [self addSubview:commandTable];
    [fView addSubview:self];
}

- (void)updateUI:(id)message
{
    
}

@end

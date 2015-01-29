//
//  QUICommonTableModal.m
//  QDianAuto
//
//  Created by 崔宇科 on 15/1/18.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUICommonTableModal.h"


@implementation QUICommonTableModal
@synthesize stateView;


- (id)init
{
    if ((self = [super init]) != nil)
    {
        
        
        
        NSComparator finderSort = ^(id string1,id string2){
            
            NSDictionary *order = @{@"运动":@1,@"动作":@2,@"时间":@3,@"光":@4};
            int a =  (int)[[order objectForKey:string1] integerValue];
            int b = (int)[[order objectForKey:string2] integerValue];
            if (a > b) {
                return (NSComparisonResult)NSOrderedDescending;
            }else if (a  < b){
                return (NSComparisonResult)NSOrderedAscending;
            }
            else
                return (NSComparisonResult)NSOrderedSame;
        };


        NSString *pListPath = [[NSBundle mainBundle] pathForResource:@"BallAction" ofType:@"plist"];
        command    = [[NSMutableDictionary alloc] initWithContentsOfFile:pListPath];
        
        keyCommand = [[command allKeys] sortedArrayUsingComparator:finderSort];
    }
    
    return self;
}

- (NSString *)modalName
{
    return @"CommonTableName";
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [keyCommand count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *keyName = [keyCommand objectAtIndex:section];
    NSArray  *keyArray = [command objectForKey:keyName];
    return [keyArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [keyCommand objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CommandCell"];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    NSString *keyName = [keyCommand objectAtIndex:indexPath.section];
    NSArray  *keyArray = [command objectForKey:keyName];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    NSString *contentWithCommand = [keyArray objectAtIndex:indexPath.row];
    NSArray *cArray = [contentWithCommand componentsSeparatedByString:@"&"];
    cell.textLabel.text = [cArray objectAtIndex:0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 112.0, 40.0)];
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 112.0, 40.0)];
    backView.backgroundColor = [UIColor grayColor];
    backView.alpha = 0.5;
    [headerView addSubview:backView];
    
    
    UILabel *centerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 40, 20)];
    centerLabel.font = [UIFont systemFontOfSize:16];
    centerLabel.textColor = [UIColor whiteColor];
    centerLabel.text = [keyCommand objectAtIndex:section];
    [headerView addSubview:centerLabel];
    
    
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0;
}


#pragma mark -
#pragma mark 表格动作

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"select row is : %d",indexPath.row);
    [QUIStateManager shareUIStateManager].stateOperator = BALLADD;
    NSString *keyName = [keyCommand objectAtIndex:indexPath.section];
    NSArray  *keyArray = [command objectForKey:keyName];
    
    NSString *contentWithCommand = [keyArray objectAtIndex:indexPath.row];
    NSArray *cArray = [contentWithCommand componentsSeparatedByString:@"&"];
    if ([cArray count] <= 1) {
        return;
    }
    NSString *commandClass = [cArray objectAtIndex:1];
    id<QCommand> commandSelected = [[QBallCommandManager shareCommandManager] createQCommand:commandClass withRobot:nil];
    
    QCommandManager *cManager = [QBallCommandManager shareCommandManager];
    [cManager addCommandToQueue:commandSelected];
    
    id<QUi> mUpdateUi =  [[QUIManager shareUIManager] obtainUI:@"Middle"];
    NSInteger qCount = [cManager queueCount];
    cManager.selectedCommand = qCount - 1;
    
    QUIMessage *message = [[QUIManager shareUIManager] genMessageType:commandClass withIntValue:qCount withType:qCount - 1 withDName:[cArray objectAtIndex:0]];
    [mUpdateUi updateUI:message];
    
    id<QUi> rUpdateUi = [[QUIManager shareUIManager] obtainUI:@"Right"];
    [rUpdateUi updateUI:message];
    
    
    
    
}





@end

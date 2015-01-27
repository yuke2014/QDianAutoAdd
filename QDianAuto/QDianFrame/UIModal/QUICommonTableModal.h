//
//  QUICommonTableModal.h
//  QDianAuto
//
//  Created by 崔宇科 on 15/1/18.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "QUIModal.h"
#import "QBallCommandManager.h"
#import "QUIManager.h"
#import "QUIStateManager.h"

@interface QUICommonTableModal : NSObject<QUIModal,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableDictionary *command;
    NSArray *keyCommand;
}

@end

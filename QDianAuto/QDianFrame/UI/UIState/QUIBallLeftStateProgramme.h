//
//  QUILeftStateProgram.h
//  QDianAuto
//
//  Created by cuiyk on 15/1/15.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QUIState.h"
#import "QUIModalManager.h"

@interface QUIBallLeftStateProgramme : UIView<QUIState>
{
    UITableView *commandTable;
    id<QUIModal,UITableViewDataSource,UITableViewDelegate> commonTableModal;
}

@end

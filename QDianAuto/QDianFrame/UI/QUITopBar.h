//
//  QUITopBar.h
//  QDianAuto
//
//  Created by cuiyk on 15/1/20.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QUi.h"
#import "QUIState.h"

@interface QUITopBar : UIView<QUi>
{
    id<QUIState> topState;
}

@end

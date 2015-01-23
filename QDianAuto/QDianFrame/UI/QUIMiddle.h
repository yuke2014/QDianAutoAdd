//
//  UIMiddle.h
//  QDianAuto
//
//  Created by 崔宇科 on 15/1/11.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUi.h"
#import "QUIStateManager.h"


@interface QUIMiddle : UIView<QUi>
{
    id<QUIState> middleState;
}

@end

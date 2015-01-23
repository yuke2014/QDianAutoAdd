//
//  QUITopBarStateSetting.h
//  QDianAuto
//
//  Created by cuiyk on 15/1/21.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QUIState.h"


@protocol QUIModal;

@interface QUITopBarStateSetting : UIView<QUIState>
{
    id<QUIModal> topModal;
}

@end

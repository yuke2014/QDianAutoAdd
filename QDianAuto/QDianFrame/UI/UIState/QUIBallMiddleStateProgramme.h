//
//  QUIBallMiddleStateProgramme.h
//  QDianAuto
//
//  Created by cuiyk on 15/1/19.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QUIState.h"
#import "QUIModal.h"

@interface QUIBallMiddleStateProgramme : UIScrollView<QUIState>
{
    id<QUIModal> middleModal;
    BOOL isAnimationRun;
}

@property CGRect srcRect;
@property CGRect dstRect;



@end

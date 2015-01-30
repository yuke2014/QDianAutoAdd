//
//  QUIRightStateProgramme.h
//  QDianAuto
//
//  Created by cuiyk on 15/1/20.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "QUIState.h"
#import "QUIModal.h"

@interface QUIBallRightStateProgramme : UIView<QUIState,UITextFieldDelegate>
{
    UIView *paramView;
    id<QUIModal> rightModal;
    NSDictionary *paramConfig;
}

@end

//
//  QUITopModal.h
//  QDianAuto
//
//  Created by cuiyk on 15/1/23.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QUIModal.h"
#import "QUIState.h"
#import "QUi.h"
#import "QUIManager.h"
#import "QUIStateManager.h"
#import "ProgrammeBallManager.h"

@interface QUITopModal : NSObject<QUIModal>

- (void)playButtonDown:(id)sender;
- (void)backToMain:(id)sender;

@end

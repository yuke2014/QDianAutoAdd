//
//  QUi.h
//  QDianAuto
//
//  Created by 崔宇科 on 15/1/11.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QUIState.h"
#import "UIView+FastAnimation.h"


@protocol QUi <NSObject>


- (void)setState:(id<QUIState>)changedState;
- (void)reloadUI;
- (void)loadUI;
- (void)updateUI:(id)message;

@end

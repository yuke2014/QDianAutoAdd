//
//  QUIMessageManager.h
//  QDianAuto
//
//  Created by cuiyk on 15/1/19.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QUIMessage.h"

@interface QUIMessageManager : NSObject

+ (QUIMessageManager *)shareMessageManager;

//- (id<QUIMessage>)createUpdateMessageType:(NSInteger)aType;

@end

//
//  QUIModalManager.h
//  QDianAuto
//
//  Created by cuiyk on 15/1/16.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QUILeftModal.h"
#import "QUIMiddleModal.h"
#import "QUICommonTableModal.h"

@interface QUIModalManager : NSObject

+ (QUIModalManager *)shareModalManager;

- (id<QUIModal>)createLeftModal;
- (id<QUIModal>)createMiddleModal;
- (id<QUIModal>)createCommonTableModal;



@end

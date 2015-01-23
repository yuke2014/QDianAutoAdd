//
//  QUIModalManager.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/16.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUIModalManager.h"

static QUIModalManager *quiModalManager = nil;

@implementation QUIModalManager

+ (QUIModalManager *)shareModalManager
{
    if (quiModalManager == nil)
    {
        quiModalManager = [[QUIModalManager alloc] init];
    }
    
    return quiModalManager;
}

- (id<QUIModal>)createLeftModal
{
    return [[QUILeftModal alloc]init];
}

- (id<QUIModal>)createMiddleModal
{
    return [[QUIMiddleModal alloc] init];
}

- (id<QUIModal>)createCommonTableModal
{
    return [[QUICommonTableModal alloc] init];
}


@end

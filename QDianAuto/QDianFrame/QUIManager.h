//
//  QUIManager.h
//  QDianAuto
//
//  Created by cuiyk on 15/1/16.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QUi.h"
#import "QUIMessage.h"

#define CBUTTON_BASE 1000
#define CSLIDER_BASE 2000
#define CLABEL_BASE  3000

@interface QUIManager : NSObject
{
    NSMutableDictionary *uiDictionary;
}

+ (QUIManager *)shareUIManager;

- (id<QUi>)obtainUI:(NSString *)key;
- (void)registerUI:(id<QUi>)ui withName:(NSString *)name;
- (QUIMessage *)genMessageType:(NSString *)aName withIntValue:(NSInteger)aLen withType:(NSInteger)aType withDName:(NSString *)dName;



@end

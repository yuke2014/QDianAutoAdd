//
//  QCommand.h
//  QDianAuto
//
//  Created by cuiyk on 15/1/21.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommandParam.h"

@protocol QCommand <NSObject>

@property (nonatomic,strong) NSMutableDictionary *p;

- (id)initWithAuto:(id)robot;
- (id)execute;

@end

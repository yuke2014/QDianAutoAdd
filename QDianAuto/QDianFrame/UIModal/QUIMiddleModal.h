//
//  QUIMiddleModal.h
//  QDianAuto
//
//  Created by 崔宇科 on 15/1/17.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QUIModal.h"
#import "ProgrammeBallManager.h"

@interface QUIMiddleModal : NSObject<QUIModal>

- (void)addCodeSelected:(id)sender;
- (void)commandSelected:(id)sender;
- (void)deleteSelected:(id)sender;
- (void)commandTouched:(id)sender;
- (void)programmeSelected:(id)sender;

@end

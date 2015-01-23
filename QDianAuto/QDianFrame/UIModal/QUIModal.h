//
//  QUIModal.h
//  QDianAuto
//
//  Created by 崔宇科 on 15/1/17.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol QUIModal <NSObject>

@property (nonatomic,assign) UIView *stateView;
- (NSString *)modalName;

@end

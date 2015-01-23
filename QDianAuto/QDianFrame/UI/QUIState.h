//
//  QUIState.h
//  QDianAuto
//
//  Created by cuiyk on 15/1/15.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol QUIState <NSObject>
@property (nonatomic,strong) NSString *stateName;

- (void)loadUI:(UIView *)fView;
- (void)updateUI:(id)message;

@end

//
//  QUILeftModal.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/15.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUILeftModal.h"

@implementation QUILeftModal
@synthesize stateView;

- (NSString *)modalName
{
    return @"LeftModal";
}


- (void)ballAction:(id)sender
{
    NSLog(@"ball is down!!!!");
}

- (void)carAction:(id)sender
{
    NSLog(@"car is down!!!!");
}

@end

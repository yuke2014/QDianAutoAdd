//
//  CommandButton.h
//  QDianAuto
//
//  Created by cuiyk on 15/1/22.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommandButton : UIButton
{
    UILabel *indexLabel;
}
@property (nonatomic) NSInteger cIndex;
@property (nonatomic,strong) NSString *commandName;
@property BOOL isMove;


@end

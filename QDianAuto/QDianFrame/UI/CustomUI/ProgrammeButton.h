//
//  ProgrammeButton.h
//  QDianAuto
//
//  Created by cuiyk on 15/1/26.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgrammeButton : UIButton

@property NSInteger indexFile;
@property (nonatomic,strong) NSString *pName;
@property (nonatomic,strong) NSString *commandString;
@property (nonatomic,strong) NSArray *commandArray;

@end

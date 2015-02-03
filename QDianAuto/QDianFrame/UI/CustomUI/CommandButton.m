//
//  CommandButton.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/22.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "CommandButton.h"
#import "QUIStateManager.h"


@implementation CommandButton

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]) != nil)
    {
         indexLabel =  [[UILabel alloc] initWithFrame:CGRectMake(22, -10, 80, 80)];
        indexLabel.font = [UIFont systemFontOfSize:20];
        indexLabel.textColor = [UIColor whiteColor];
        [self addSubview:indexLabel];
    }
    
    return self;
}


- (void)setCIndex:(NSInteger)cIndex
{
    _cIndex = cIndex;
    indexLabel.text = [NSString stringWithFormat:@"%d",(int)(cIndex+1)];
    
    
}



@end

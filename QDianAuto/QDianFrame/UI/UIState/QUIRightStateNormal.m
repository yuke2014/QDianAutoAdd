//
//  QUIRightStateNormal.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/20.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QUIRightStateNormal.h"

@implementation QUIRightStateNormal
@synthesize stateName;

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]) != nil)
    {
    }
    
    return self;
}

- (void)loadUI:(UIView *)fView
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 230, 200)];
    imageView.image = [UIImage imageNamed:@"指令区圆角黑色透明底.png"];
    [self addSubview:imageView];

    
    UIImage *ballImage     = [UIImage imageNamed:@"bb.png"];
    UIButton *profileButton = [UIButton buttonWithType:UIButtonTypeCustom];
    profileButton.frame     = CGRectMake(40, 5, 130, 130);
    [profileButton setImage:ballImage forState:UIControlStateNormal];
    
    //[ballButton addTarget:middleModal action:@selector(carCodeSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:profileButton];
    
    [fView addSubview:self];

}

- (void)updateUI:(id)message
{
    
}


@end

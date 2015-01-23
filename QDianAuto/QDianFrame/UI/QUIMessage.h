//
//  QUIMessage.h
//  QDianAuto
//
//  Created by cuiyk on 15/1/22.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QUIMessage : NSObject

@property  NSInteger mType;
@property  NSInteger mLen;
@property (nonatomic,strong) NSString  *mName;
@property (nonatomic,strong) NSString  *dName;
@property (nonatomic,strong) id        mContent;


@end

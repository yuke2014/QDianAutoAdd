//
//  QBallRoll.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/21.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "QBallRoll.h"

@implementation QBallRoll

- (id)execute
{
    //指令参数和设置界面的顺序对应(如:滚动就是速度，角度，延迟)，存在字典里面，可以按照下面方式获取第一个参数就是
    
    //self.p objectForKey:[NSNumber numberWithInt:0]
    
    //第二个参数就是角度
    //self.p objectForKey:[NSNumber numberWithInt:1]
    //有些switch开关调整的布尔值可以统一yes，因为界面还没处理，注意获取的参数一定和界面顺序一致，如果界面没有可以先给默认值

    
    
    NSLog(@"QBallRol param is : %@",self.p);
    return nil;
    //返回值可以是任意类型，如果需要加入队列之行可以在这里构建消息返回在commitQueue方法统一执行，如果支持分步执行，则可以不用返回直接执行
}

@end

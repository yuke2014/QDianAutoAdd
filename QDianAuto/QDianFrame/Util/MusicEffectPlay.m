//
//  MusicEffectPlay.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/30.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "MusicEffectPlay.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>


@implementation MusicEffectPlay

+(void)playMusicWithFileName:(NSString *)aName
{
    SystemSoundID soundID;
    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:aName withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)fileUrl, &soundID);
    AudioServicesPlaySystemSound(soundID);

}

@end

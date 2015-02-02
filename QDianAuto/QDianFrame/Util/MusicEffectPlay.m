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
    SystemSoundID soundid;
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:aName ofType:@"wav"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundUrl, &soundid);
    AudioServicesPlaySystemSound(soundid);
}

@end

//
//  ProgrammerManager.m
//  QDianAuto
//
//  Created by cuiyk on 15/1/26.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import "ProgrammerManager.h"

static ProgrammerManager *pManager = nil;

@implementation ProgrammerManager

+ (ProgrammerManager *)shareProgrammeManager
{
    if (pManager == nil)
    {
        pManager = [[self alloc] init];
    }
    
    return pManager;
}

- (id)init
{
    if ((self = [super init]) != nil)
    {
        pDic = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}


- (NSString *)getDocumentPath
{
    NSArray *array		= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docStr	= [array objectAtIndex:0];
    
    return docStr;
}


- (void)initPDir
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *array		= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docStr	= [array objectAtIndex:0];
    NSLog(@"docStr is ::: %@",docStr);

    NSString *pCarDir = [docStr stringByAppendingPathComponent:@"CarProgramme"];
    
    if (![fileManager fileExistsAtPath:pCarDir])
    {
        NSError *error;
        [fileManager createDirectoryAtPath:pCarDir withIntermediateDirectories:NO attributes:nil error:&error];
    }
    
    NSString *pBallDir = [docStr stringByAppendingPathComponent:@"BallProgramme"];
    if (![fileManager fileExistsAtPath:pBallDir])
    {
        NSError *error;
        [fileManager createDirectoryAtPath:pBallDir withIntermediateDirectories:NO attributes:nil error:&error];
    }
    
}

- (NSDictionary *)loadAllProgrammerFromPath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *pDir = [[self getDocumentPath] stringByAppendingPathComponent:[self programmeName]];
    
    NSArray *pArray = [fileManager contentsOfDirectoryAtPath:pDir error:nil];
    
    
    self.fileCount = [pArray count] - 1;
    
    NSInteger mFileName = 0;
    
    for (NSString *fileName in pArray)
    {
        if ([fileName hasPrefix:@"."]) {
            continue;
        }
        NSString *filePath = [pDir stringByAppendingPathComponent:fileName];
        NSArray *commandArray = [[NSArray alloc] initWithContentsOfFile:filePath];
        
        if ([fileName integerValue] > mFileName)
        {
            mFileName = [fileName integerValue];
        }
        
        [pDic setObject:commandArray forKey:[NSNumber numberWithInteger:[fileName integerValue]]];
    }
    
    self.maxFileName = mFileName;
    return pDic;

}

- (BOOL)saveCurrentProgramme:(NSArray *)commandArray
{
    NSString *pDir = [[self getDocumentPath] stringByAppendingPathComponent:[self programmeName]];
    
    NSString *filePath = [pDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%ld",self.selectedProgramme]];
    NSLog(@"save command filepath is : %@",filePath);
    [commandArray writeToFile:filePath  atomically:YES];
    
    return YES;
}

- (NSString *)programmeName
{
    return @"";
}


@end

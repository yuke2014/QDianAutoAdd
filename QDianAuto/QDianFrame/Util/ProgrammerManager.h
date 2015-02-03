//
//  ProgrammerManager.h
//  QDianAuto
//
//  Created by cuiyk on 15/1/26.
//  Copyright (c) 2015年 崔宇科. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProgrammerManager : NSObject
{
    NSMutableDictionary *pDic;
}

@property NSInteger selectedProgramme;
@property NSInteger fileCount;
@property NSInteger maxFileName;

@property (nonatomic,strong) NSString *selectedProgrammeName;

+ (ProgrammerManager *)shareProgrammeManager;
- (void)initPDir;
- (NSString *)getDocumentPath;

- (NSDictionary *)loadAllProgrammerFromPath;
- (BOOL)saveCurrentProgramme:(NSArray *)commandArray;
- (NSString *)programmeName;

@end

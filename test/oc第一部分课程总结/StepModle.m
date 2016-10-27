//
//  StepModle.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "StepModle.h"

@implementation StepModle
-(StepModle *)init:(NSMutableDictionary *)stepData{
    self = [super init];
    if (self) {
        _stepModles = [[NSMutableArray alloc]init];
        NSLog(@"%@", stepData);
        _fatherData     = stepData;
        _stepIscomplet  = [stepData[@"stepIsComplet"] boolValue];
        _stepDetails    = stepData[@"stepDetails"];
        _stepName       = stepData[@"setpName"];
        _stepImagePath  = stepData[@"stepImagePath"];
        _stepEndTime    = stepData[@"stepEndTime"];
        _stepBuildTime  = stepData[@"stepBuildTime"];
        _giftPath       = stepData[@"giftPath"];
        _steps          = stepData[@"steps"];
        [self initAllStepModle];
        _isOpen         = NO;
        _isRoot         = NO;
        _isShow         = NO;
        _SpaceNum       = 100;//缩进错误会比较明显的被看到
    }
    return self;
}
 
-(void)updataAll{
    NSNumber* stepIscompletNum = [[NSNumber alloc]initWithBool:_stepIscomplet];
    [_fatherData setObject:stepIscompletNum forKey:@"stepIsComplet"];
    [_fatherData setObject:_stepDetails forKey:@"stepDetails"];
    [_fatherData setObject:_stepName forKey:@"setpName"];
    [_fatherData setObject:_stepImagePath forKey:@"stepImagePath"];
    [_fatherData setObject:_stepEndTime forKey:@"stepEndTime"];
    [_fatherData setObject:_stepBuildTime forKey:@"stepBuildTime"];
    [_fatherData setObject:_giftPath forKey:@"giftPath"];
    [_fatherData setObject:_steps forKey:@"steps"];
}

-(void)initAllStepModle{
    StepModle* singleStep = nil;
    for (NSInteger i =0; i<_steps.count; i++) {
        //这个时候 steps 就已经添加了新的项了 所以不用再加add方法
        singleStep = [[StepModle alloc]init:_steps[i]];
        [_stepModles addObject:singleStep];
    }
}

@end

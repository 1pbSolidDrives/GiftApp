//
//  StepModle.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "StepModel.h"

@implementation StepModel
-(StepModel *)init:(NSMutableDictionary *)stepData{
    self = [super init];
    if (self) {
        _stepModels = [[NSMutableArray alloc]init];
        NSLog(@"%@", stepData);
        _myDataplist     = stepData;
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
 
-(void)pushData{
    NSNumber* stepIscompletNum = [[NSNumber alloc]initWithBool:_stepIscomplet];
    [_myDataplist setObject:stepIscompletNum forKey:@"stepIsComplet"];
    [_myDataplist setObject:_stepDetails forKey:@"stepDetails"];
    [_myDataplist setObject:_stepName forKey:@"setpName"];
    [_myDataplist setObject:_stepImagePath forKey:@"stepImagePath"];
    [_myDataplist setObject:_stepEndTime forKey:@"stepEndTime"];
    [_myDataplist setObject:_stepBuildTime forKey:@"stepBuildTime"];
    [_myDataplist setObject:_giftPath forKey:@"giftPath"];
    [_myDataplist setObject:_steps forKey:@"steps"];
    
 }

-(void)initAllStepModle{
    StepModel* singleStep = nil;
    for (NSInteger i =0; i<_steps.count; i++) {
        //这个时候 steps 就已经添加了新的项了 所以不用再加add方法
        singleStep = [[StepModel alloc]init:_steps[i]];
        singleStep.delegate = self;
        singleStep.stepNumInPlist = i;
        [_stepModels addObject:singleStep];
    }
}
//我的子节点会通过这个协议让我刷新 子节点发给我的刷新信息
-(Boolean)stepModelProtocolUpData:(StepModel *)sender{
    @try {
        //model容器刷新
        [_stepModels replaceObjectAtIndex:sender.stepNumInPlist withObject:sender];
        //plist数据刷新
        [_steps replaceObjectAtIndex:sender.stepNumInPlist withObject:sender.myDataplist];
        [_myDataplist setObject:_steps forKey:@"steps"];
        //通知上一层 刷新
        Boolean result = [self updataAll];
        NSLog(@"stepModelProtocol --- StepModel %li 刷新数据成功",sender.stepNumInPlist);
        return result;
    } @catch (NSException *exception) {
        NSLog(@"stepModelProtocol --- StepModel %li 刷新数据失败",sender.stepNumInPlist);

        return NO;
    } @finally {
        
    }

    return YES;
}
//我会通过这个代理 将我的刷新请求通知到上层 
-(Boolean)updataAll{
    [self pushData];
    if (_delegate && [_delegate conformsToProtocol:@protocol(StepModelProtocol)]) {
       return [_delegate stepModelProtocolUpData:self];
    }
    return NO;
}
//添加
-(void)addStep:(NSString *)stepName
   stepDetails:(NSString *)stepDetails
 stepImagePath:(NSString *)stepImagePath
 stepBuildTime:(NSString *)stepBuildTime
   stepEndTime:(NSString *)stepEndTime
      giftPath:(NSMutableArray *)giftPath{
    
    //NSMutableDictionary *stepData =  _myDataplist[@"steps"][0];

    NSMutableDictionary *stepData = [[NSMutableDictionary alloc]init];
    
    [stepData setObject:stepDetails forKey:@"stepDetails"];
    [stepData setObject:stepName forKey:@"setpName"];
    [stepData setObject:stepImagePath forKey:@"stepImagePath"];
    [stepData setObject:stepEndTime forKey:@"stepEndTime"];
    [stepData setObject:stepBuildTime forKey:@"stepBuildTime"];
    [stepData setObject:giftPath forKey:@"giftPath"];
    NSMutableArray *steps = [[NSMutableArray alloc]init];
    [stepData setObject:steps forKey:@"steps"];
    

    [_myDataplist[@"steps"] addObject:stepData];
    
    StepModel* newStepModel = [[StepModel alloc]init:stepData];
    newStepModel.delegate = self;
    //将新的step 放入modellist  plistlist
    [_stepModels addObject:newStepModel];
    newStepModel.stepNumInPlist = _stepModels.count-1;
    [newStepModel updataAll];
 
 }

//删除 子节点 代理
-(Boolean)stepModelProtocolDeleteMe:(StepModel *)sender{
    //删除子节点
    if ([self deleteSon:sender]) {
        return  [self updataAll];
    }
    return NO;
}

-(Boolean)deleteSon:(StepModel*)son{
    @try {
        [_steps removeObjectAtIndex:son.stepNumInPlist];
 
        [_myDataplist setObject:_steps forKey:@"steps"];
        [_stepModels removeObjectAtIndex:son.stepNumInPlist];
        for (NSInteger i =0; i<_stepModels.count; i++) {
            StepModel* stepBuf =  _stepModels[i];
            stepBuf.stepNumInPlist = i;
        }
        return YES;
    } @catch (NSException *exception) {
        NSLog(@" model %li deleteSon error",self.stepNumInPlist);
        return NO;
    } @finally {
        
    }
}

//删除我自己
-(Boolean)deleteMe{
     if (_delegate && [_delegate conformsToProtocol:@protocol(StepModelProtocol)]) {
        return [_delegate stepModelProtocolDeleteMe:self];
    }
    return NO;
}

@end

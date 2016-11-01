//
//  TargetModle.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "TargetModel.h"
#import "DataController.h"

@implementation TargetModel

-(TargetModel*)init:(NSMutableDictionary *)data myName:(NSInteger)myName{
    self = [super init];
    if (self) {
        _giftsModel = [[NSMutableArray alloc]init];
        _stepsModel = [[NSMutableArray alloc]init];
        _mySelfDataPlist = data;
        _myName = myName;
        _headerData = data[@"headerFooter"];
        _stepData = data[@"steps"];
        _giftData = data[@"gifts"];
        NSLog(@"_headerData%@", _headerData);
        NSLog(@"_stepData%@", _stepData);
        NSLog(@"_giftData%@", _giftData);

        _headerModel = [[HeaderModel alloc]init:_headerData];
        _headerModel.delegate = self;
        [self initSteps];
        [self initGift];
     }
    return self;
}

-(void)initSteps{
     StepModel* sigleStep = nil;
    for (NSInteger i = 0 ; i<_stepData.count; i++) {
        sigleStep = [[StepModel alloc]init:_stepData[i]];
        sigleStep.isOpen = NO;
        sigleStep.isRoot = YES;
        sigleStep.isShow = YES;
        sigleStep.SpaceNum = 0;
        sigleStep.delegate = self;
        [_stepsModel addObject:sigleStep];
    }
}
-(void)initGift{
     GiftModel* singleGift = nil;
    for (NSInteger i =0; i<_giftData.count; i++) {
        singleGift = [[GiftModel alloc]init:_giftData[i]];
        singleGift.giftNumInPlist = i;
        singleGift.delegate = self;
        [_giftsModel addObject:singleGift];
    }
}

-(Boolean)stepModelProtocol:(StepModel *)sender{
    
    return YES;
}

-(Boolean)upDataAll{
    [self upDataMySelf];

    if (_delegate &&[_delegate conformsToProtocol:@protocol(TargetModelProtocol)]) {
        if([_delegate targetModelUpData:self ])
        {
            return YES;
        }
        NSLog(@"TargetModel %li upDataInFather 更新失败",_myName);
        return NO;
    }
    NSLog(@"TargetModel %li 无人实现这个协议",_myName);
    return NO;

}
/*
 当自己被修改的时候 
 将model数据存入plist容器中
 
 但是 target并没有自己的数据 他只是一个容器而已
 */
-(void)upDataMySelf{
    //header
    
    //gift
    
    //step

}

//实现headerModel的协议
-(Boolean)headerModelProtocolUpData:(HeaderModel *)myself{
    _headerData = myself.myDataPlist;

    if ([self upDataAll]) {
        NSLog(@"TargetModel %li HeaderModel 更新完成",_myName);

        return  YES;
    }
    NSLog(@"TargetModel %li HeaderModel 更新失败",_myName);
    return NO;
}

//实现giftmodel的协议
-(Boolean)giftModelProtocolUpData:(GiftModel *)mySelf{
    @try {
        [_giftData replaceObjectAtIndex:mySelf.giftNumInPlist withObject:mySelf.myDataPlist];
        [_giftsModel replaceObjectAtIndex:mySelf.giftNumInPlist withObject:mySelf];
        

        
        if ([self upDataAll]) {
            NSLog(@"giftModelProtocolUpData GiftModel %li 更新成功",mySelf.giftNumInPlist);
            return YES;
        }
    } @catch (NSException *exception) {
        NSLog(@"giftModelProtocolUpData GiftModel %li 更新失败",mySelf.giftNumInPlist);
        return NO;
    } @finally {
        
    }
}
//实现stepmodel的协议
-(Boolean)stepModelProtocolUpData:(StepModel *)sender{
    @try {
        [_stepData replaceObjectAtIndex:sender.stepNumInPlist withObject:sender.myDataplist];
        [_stepsModel replaceObjectAtIndex:sender.stepNumInPlist withObject:sender];
        [_mySelfDataPlist setObject:_stepData forKey:@"steps"];
        
        //NSMutableArray* stepBuf = _mySelfDataPlist[@"steps"];
//        NSString* name3 = stepBuf[0][@"setpName"];
//        //---------
//        //测试1， step相关的 step中的新数据是否调价到了target中
//        NSString* name1 = _stepData[sender.stepNumInPlist][@"setpName"];
//        NSString* name2 = [(StepModel*)_stepsModel[sender.stepNumInPlist]stepName];
//
//        //---------
        
        if (![[DataController getInstence]sonIsModifiedToWriteImmediately]) {
            NSLog(@"TargetModel %li upDataInFather 子节点自动更新没有开启 请手动写入",_myName);
            
            return NO;
        }
        if ([self upDataAll]) {
            NSLog(@"stepModelProtocolUpData StepModel %li 更新成功",sender.stepNumInPlist);
            return YES;
        }
    } @catch (NSException *exception) {
                NSLog(@"stepModelProtocolUpData StepModel %li 更新失败 %@",sender.stepNumInPlist,exception);
        return NO;
    } @finally {
        
    }
}

//删除step
-(Boolean)stepModelProtocolDeleteMe:(StepModel *)sender{
    @try {
        [_stepData removeObjectAtIndex:sender.stepNumInPlist ];
        [_stepsModel removeObjectAtIndex:sender.stepNumInPlist];
        for (NSInteger i =0; i<_stepsModel.count; i++) {
            StepModel* stepBuf =  _stepsModel[i];
            stepBuf.stepNumInPlist = i;
        }
        return [self upDataAll];
    } @catch (NSException *exception) {
        return NO;
    } @finally {
        
    }
}

//添加step
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

    
    StepModel* newStepModel = [[StepModel alloc]init:stepData];
    newStepModel.delegate = self;
    newStepModel.stepNumInPlist = _stepsModel.count-1;
    
    //将新的step 放入modellist  plistlist
    [_stepData addObject:stepData];
    [_stepsModel addObject:newStepModel];

    [newStepModel updataAll];
    
}


//添加gift
-(void)addGift:(NSString*)giftName
       giftUrl:(NSMutableDictionary*)giftUrl
     giftImage:(NSString*)giftImage
      setpPath:(NSMutableArray*)setpPath{
    
    NSMutableDictionary *giftDatabuf = [[NSMutableDictionary alloc]init];
    [giftDatabuf setObject:giftName forKey:@"giftName"];
    [giftDatabuf setObject:giftUrl forKey:@"giftImage"];
    [giftDatabuf setObject:giftImage forKey:@"giftUrl"];
    [giftDatabuf setObject:setpPath forKey:@"setpPath"];
    
    GiftModel* newGiftModel = [[GiftModel alloc]init:giftDatabuf];
    
    newGiftModel.delegate = self;
    newGiftModel.giftNumInPlist = _giftsModel.count-1;
    [_giftData addObject:giftDatabuf];
    [_giftsModel addObject:newGiftModel];
    [newGiftModel updataAll];

}
@end

//
//  DataController.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/24.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "DataController.h"
#define PLISTNAME @"targetApp"

@implementation DataController

static DataController* myInstence = nil;

+(DataController*)getInstence{
    if (myInstence == nil) {
        myInstence = [[DataController alloc]init];
    }
    return myInstence;
}

-(DataController*)init{
    self = [super init];
    if (self) {
        [self initAllData];
        [self initTarget];
    }
    return self;
}

//读取所有数据
-(void)initAllData{
    _targetMaster = [[NSMutableArray alloc]init];
    _stepCellMaster = [[NSMutableArray alloc]init];
    _headerFooterMaster = [[NSMutableArray alloc]init];
    _giftMaster = [[NSMutableArray alloc]init];
    _plistPath = [[NSBundle mainBundle] pathForResource:PLISTNAME ofType:@"plist"];
    _dataMaster = [NSMutableArray arrayWithContentsOfFile:_plistPath];
    //NSLog(@"初始化数据----- plist = %@",_dataMaster);
    _sonIsModifiedToWriteImmediately = YES;
}
//更新数据
-(Boolean)upDataAllData{
    if ([_dataMaster writeToFile:_plistPath atomically:YES]) {
        NSLog(@"属性列表添加数据成功！");
        return YES;
    }else {
        NSLog(@"属性列表添加数据失败！");
        return NO;
    }
}
//更新taget

-(Boolean)targetModelUpData:(TargetModel *)sender{
    @try {
        if ([_dataMaster containsObject:sender]) {
            [_dataMaster replaceObjectAtIndex:sender.myName withObject:sender.mySelfDataPlist];
        }else{
            [_targetMaster addObject:sender];
            [_dataMaster addObject:sender.mySelfDataPlist];
        }

        NSLog(@"targetModelUpData %li 成功",(long)sender.myName);
        [self upDataAllData];
        return YES;
    } @catch (NSException *exception) {
        NSLog(@"targetModelUpData %li 失败",(long)sender.myName);
        return NO;
    } @finally {
        
    }
   
}

//表头的数据
-(NSMutableDictionary*)getTargetDictionaryForHeaderFooter:(NSInteger)tag{
    [self initAllData];
    NSMutableDictionary* dicBuf =_dataMaster[tag][@"headerFooter"];
    @try {
        NSLog(@"%@", dicBuf[@"setpName"]);
    } @catch (NSException *exception) {
        NSLog(@"getTargetDictionaryForHeaderFooter --- error！ 可能是 获取的东西有问题了！！快去检查下你的 tag 或者father");
        
    } @finally {
        
    }
    return dicBuf;
}

-(Boolean)setTargetDictionary:(NSMutableDictionary*)newDictionary ForHeaderFooterInTag:(NSInteger)tag{
    //[self initAllData];//可能不会那么频繁的刷新
    [_dataMaster[tag] setObject:newDictionary forKey:@"headerFooter"];

    if ([self upDataAllData]) {
        return YES;
    }
    return NO;
}


//获取步骤的数据
-(NSMutableArray*)getStepsArrayFor:(NSInteger)tag fromFather:(NSMutableArray*)father{
    [self initAllData];
    NSMutableArray* stepDic = nil;
    NSMutableDictionary* dicBuf = nil;
    if (father == nil) {
        dicBuf =_dataMaster[tag];
        stepDic = dicBuf[@"steps"];
    }
    else{
        dicBuf =father[tag];
        stepDic = dicBuf[@"steps"];
    }
    @try {
        NSLog(@"%@", stepDic[0]);
    } @catch (NSException *exception) {
        NSLog(@"getStepsArrayFor --- error！ 可能是 获取的东西有问题了！！快去检查下你的 tag 或者father");

    } @finally {
        
    }
    return stepDic;
}



//设置新的步骤信息
-(Boolean)setStepsArray:(NSMutableArray*)newArray For:(NSInteger)tag inFather:(NSMutableArray*)father{
    
    if (father ==nil) {
        NSMutableDictionary* dicBuf =_dataMaster[tag];
        [dicBuf setObject:newArray forKey:@"steps"];
    }
    else{
        [father[tag] setObject:newArray forKey:@"steps"];
    }
    
    if ([self upDataAllData]) {
        return YES;
    }
    return NO;
}

//奖励的数据 尝试一下 传送的是指针 所以是不是只修改父节点就可以了 之后只要将新的根 写到plist中就可以了
-(NSMutableArray*)getGiftsArrayFor:(NSInteger)tag{
    [self initAllData];
    NSMutableArray* giftsDic = nil;
    NSMutableDictionary* dicBuf =_dataMaster[tag];
    giftsDic = dicBuf[@"gifts"];
    @try {
        NSLog(@"%@", giftsDic[0]);
    } @catch (NSException *exception) {
        NSLog(@"getGiftsArrayFor --- error！ 可能是 获取的东西有问题了！！快去检查下你的 tag");
        
    } @finally {
        
    }
    return giftsDic;
}

-(Boolean)setGiftsArray:(NSMutableArray*)newArray ForTag:(NSInteger)tag{
    NSMutableArray* giftsDic = [self getGiftsArrayFor:tag];
    [giftsDic setArray:newArray];
    if ([self upDataAllData]) {
        return YES;
    }
    return NO;
}

-(void)initTarget{
    

    for (NSInteger i=0; i<_dataMaster.count; i++) {
        TargetModel* singleTarget = nil;
        singleTarget = [[TargetModel alloc]init:_dataMaster[i] myName:i];
        NSLog(@"%@", _dataMaster[i]);
        singleTarget.delegate = self;
        [_targetMaster addObject:singleTarget];
    }
    //测试证明 model中的数据并不是 plist数据的指针
//    TargetModel* singleTarget = _targetMaster[0];
//    HeaderModel* testHeaderModel = singleTarget.headerModel;
//    testHeaderModel.targetHeaderName = @"TestSingle !!!!";
//    
//    NSString* masterName = _dataMaster[0][@"headerFooter"][@"targetHeaderName"];
    //初始化cell 用的顺序cell
    [self initCellMaster];
}

//这个东西直接就可以发送给tableView 他只要逐行显示就可以了
-(void)initCellMaster{

    //每次更新之前删除所有数据
    [_headerFooterMaster removeAllObjects];
    [_stepCellMaster removeAllObjects];
    [_giftMaster removeAllObjects];
    
    TargetModel* targetModelBuf = nil;
    HeaderModel* headerModelBuf = nil;
    NSMutableArray* stepsModelBuf = nil;

    NSMutableArray* giftBuf = nil;
//    NSMutableArray* targetBuf = [[NSMutableArray alloc]init];
     for (NSInteger i =0; i< _targetMaster.count; i++) {
         
         NSMutableArray* cellBuf = [[NSMutableArray alloc]init];
         targetModelBuf = _targetMaster[i];

         //添加target
         headerModelBuf = targetModelBuf.headerModel;
         [_headerFooterMaster addObject:headerModelBuf];
         
         //添加gift
         giftBuf = targetModelBuf.giftsModel;
         
         for (NSInteger k=0 ; k<giftBuf.count; k++) {
             [cellBuf addObject:giftBuf[k]];
             [_giftMaster addObject:giftBuf[k]];
         }
         
         //[_stepCellMaster addObject:targetBuf];
         //添加steps
         stepsModelBuf = targetModelBuf.stepsModel;
         for (NSInteger j =0 ; j < stepsModelBuf.count; j++) {
             [self pushStepForCell:stepsModelBuf[j] in:cellBuf];
         }
         [_stepCellMaster addObject:cellBuf];
         

    }
}



-(void)pushStepForCell:(StepModel*)singleStep in:(NSMutableArray*)cellBuf{
    //遍历每个节点 如果可以显示就显示
    if (singleStep.isShow == YES) {
        [cellBuf addObject:singleStep];
        for (NSInteger i =0 ; i < singleStep.stepModels.count; i++) {
            [self pushStepForCell:singleStep.stepModels[i] in:cellBuf];
        }
    }else{
        //什么也不做
    }
}

-(TargetModel *)getNewTarget{
    NSMutableDictionary* newTargetData = [[NSMutableDictionary alloc]init];
    NSMutableDictionary* header = [[NSMutableDictionary alloc]init];
    NSMutableArray* steps = [[NSMutableArray alloc]init];
    NSMutableArray* gifts = [[NSMutableArray alloc]init];

    header = [self getNewHeader];

    steps = [self getNewStep];
    gifts = [self getNewGift];

    [newTargetData setObject:header forKey:@"headerFooter"];
    [newTargetData setObject:steps forKey:@"steps"];
    [newTargetData setObject:gifts forKey:@"gifts"];

    
    //暂时先不加到plist的数据中
    TargetModel* targetModel = [[TargetModel alloc]init:newTargetData myName:_dataMaster.count];
    targetModel.delegate = self;
    
    return targetModel;
}

-(NSMutableDictionary*)getNewHeader{
    NSMutableDictionary* header = [[NSMutableDictionary alloc]init];

    NSString* targetBeginTime = @"";
    NSString* targetExpectTime = @"";
    NSString* completeness = @"";
    NSString* targetDetails = @"";
    NSString* targetHeaderName = @"sssss";
    NSString* targetHeaderImagePath = @"";
    [header setObject:targetBeginTime forKey:@"targetBeginTime"];
    [header setObject:targetExpectTime forKey:@"targetExpectTime"];
    [header setObject:completeness forKey:@"completeness"];
    [header setObject:targetDetails forKey:@"targetDetails"];
    [header setObject:targetHeaderName forKey:@"targetHeaderName"];
    [header setObject:targetHeaderImagePath forKey:@"targetHeaderImagePath"];
    return header;
}

-(NSMutableArray*)getNewStep{
    NSMutableArray* steps = [[NSMutableArray alloc]init];
    NSMutableDictionary* stepStep = [[NSMutableDictionary alloc]init];
    NSMutableArray* stepStepStep = [[NSMutableArray alloc]init];

    
    NSNumber* stepIsComplet = [[NSNumber alloc]init];
    NSString* stepDetails= @"";
    NSString* setpName= @"";
    NSString* stepImagePath= @"";
    NSString* stepEndTime= @"";
    NSString* stepBuildTime= @"";
    NSMutableArray* giftPath =[[NSMutableArray alloc]init];
    
    [stepStep setValue:stepIsComplet forKey:@"stepIsComplet"];
    [stepStep setValue:stepDetails forKey:@"stepDetails"];
    [stepStep setValue:setpName forKey:@"setpName"];
    [stepStep setValue:stepImagePath forKey:@"stepImagePath"];
    [stepStep setValue:stepEndTime forKey:@"stepEndTime"];
    [stepStep setValue:stepBuildTime forKey:@"stepBuildTime"];
    [stepStep setValue:giftPath forKey:@"giftPath"];
    [stepStep setValue:stepStepStep forKey:@"steps"];
    [steps addObject:stepStep];
    [steps addObject:stepStep];
    return steps;
}

-(NSMutableArray*)getNewGift{
    NSMutableArray* gifts = [[NSMutableArray alloc]init];
    NSMutableDictionary* gift = [[NSMutableDictionary alloc]init];
    NSString* giftName1= @"";
    NSString* giftImage= @"";
//-----------------------------------------------
    NSMutableArray* giftUrl1= [[NSMutableArray alloc]init];
//-----------------------------------------------

    NSMutableArray* setpPath= [[NSMutableArray alloc]init];
    
    [gift setObject:giftName1 forKey:@"giftName"];
    [gift setObject:giftImage forKey:@"giftImage"];
    [gift setObject:giftUrl1 forKey:@"giftUrl"];
    [gift setObject:setpPath forKey:@"setpPath"];
    [gifts addObject:gift];

    return gifts;
}

-(GiftModel*)getNewGiftModel{
    NSMutableArray* newGift = [self getNewGift];
    GiftModel* newGiftModel = [[GiftModel alloc]init:newGift[0]];
    return newGiftModel;
}

-(StepModel*)getNewStepModel{
    NSMutableArray* newStep = [self getNewStep];
    StepModel* newStepModel = [[StepModel alloc]init:newStep[0] father:nil];
    return newStepModel;
}

//刷新数据
-(void)reloadCellMaster{
    [self initCellMaster];
}

@end















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

//初始化所有数据
-(void)initAllData{
    _targetMaster       = [[NSMutableArray alloc]init];
    _stepCellMaster     = [[NSMutableArray alloc]init];
    _headerFooterMaster = [[NSMutableArray alloc]init];
    _giftMaster         = [[NSMutableArray alloc]init];
    _plistPath          = [[NSBundle mainBundle] pathForResource:PLISTNAME ofType:@"plist"];
    _dataMaster         = [NSMutableArray arrayWithContentsOfFile:_plistPath];
    //NSLog(@"初始化数据----- plist = %@",_dataMaster);
    
}
//更新数据 进plist
-(Boolean)upDataAllData{
    if ([_dataMaster writeToFile:_plistPath atomically:YES]) {
        NSLog(@"属性列表添加数据成功！");
        return YES;
    }else {
        NSLog(@"属性列表添加数据失败！");
        return NO;
    }
}

//获取表头的数据
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

//初始化target 把plist读取的数据直接写入到model中 让他自己对自己做数据修改 修改了也就修改了最外边的master
-(void)initTarget{
    
    TargetModel* sigleTarget = nil;
    
    for (NSInteger i=0; i<_dataMaster.count; i++) {
        sigleTarget = [[TargetModel alloc]init:_dataMaster[i]];
        NSLog(@"%@", _dataMaster[i]);
        [_targetMaster addObject:sigleTarget];
    }
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
    NSMutableArray* targetBuf = [[NSMutableArray alloc]init];
    for (NSInteger i =0; i< _targetMaster.count; i++) {
        
        NSMutableArray* stepsBuf = [[NSMutableArray alloc]init];
        
        
        targetModelBuf = _targetMaster[i];
        
        //添加target
        headerModelBuf = targetModelBuf.headerModel;
        [_headerFooterMaster addObject:headerModelBuf];
        
        //添加steps
        stepsModelBuf = targetModelBuf.stepsModel;
        
        for (NSInteger j =0 ; j < stepsModelBuf.count; j++) {
            [self pushStepForCell:stepsModelBuf[j] in:stepsBuf];
        }
        [_stepCellMaster addObject:stepsBuf];
        
        //添加gift
        giftBuf = targetModelBuf.giftsModel;
        [targetBuf addObject:giftBuf];
        [_giftMaster addObject:giftBuf];
    }
}



-(void)pushStepForCell:(StepModel*)singleStep in:(NSMutableArray*)cellBuf{
    //遍历每个节点 如果可以显示就显示
    if (singleStep.isShow == YES) {
        [cellBuf addObject:singleStep];
        for (NSInteger i =0 ; i < singleStep.stepModles.count; i++) {
            [self pushStepForCell:singleStep.stepModles[i] in:cellBuf];
        }
    }else{
        //什么也不做
    }
}


//-------------------------------------------------------
//设置表头数据  可以弃置不用的方法 因为设置数据都在model自己那里就完成了
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
@end















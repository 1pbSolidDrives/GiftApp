//
//  GiftModle.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "GiftModel.h"
#import "DataController.h"
@implementation GiftModel
-(GiftModel *)init:(NSMutableDictionary *)giftData{
    self = [super init];
    if (self) {
        _myDataPlist = giftData;
        _giftName   = giftData[@"giftName"];
        _giftImage  = giftData[@"giftImage"];
        _giftUrl    = giftData[@"giftUrl"];
        _stepPath   = giftData[@"setpPath"];
        _canBuyThisGift = NO;
    }
    
    return self;
}
-(Boolean)updataAll{
    [_myDataPlist setObject:_giftName forKey:@"giftName"];
    [_myDataPlist setObject:_giftImage forKey:@"giftImage"];
    [_myDataPlist setObject:_giftUrl forKey:@"giftUrl"];
    [_myDataPlist setObject:_stepPath forKey:@"setpPath"];
    if (_delegate && [_delegate conformsToProtocol:@protocol(GiftModelProtocol)]) {
        Boolean result = [_delegate giftModelProtocolUpData:self];
        
        return result;
    }
    return NO;
}
-(void)dataTest{
    NSMutableArray* targets =[[DataController getInstence]targetMaster];
    TargetModel* targetBuf = targets[1];
    //测试1 修改一个target项
    //        HeaderModel* headermodel = [targetBuf headerModel];
    //    //
    //        NSString* targetName = [headermodel targetHeaderName];
    //        NSLog(@"targetName %@",targetName);
    //    headermodel.targetHeaderName = @"把数据部分调通";
    //    NSLog(@"targetName %@",headermodel.targetHeaderName);
    //    [headermodel upDataAll ];
    //    TargetModel* targetBuf2 = [[DataController getInstence]targetMaster][0];
    //    NSLog(@"targetBuf %@",[[targetBuf2 headerModel] targetHeaderName]);
    //    NSLog(@"----------targetBuf %@",[[DataController getInstence] dataMaster][0][@"headerFooter"][@"targetHeaderName"]);
    //    NSString* _plistPath = [[NSBundle mainBundle] pathForResource:@"targetApp" ofType:@"plist"];
    //
    //    NSMutableArray * DataMaster = [NSMutableArray arrayWithContentsOfFile:_plistPath];
    //    NSLog(@"DataMaster %@",DataMaster[0][@"headerFooter"][@"targetHeaderName"]);
    
    
    //测试2 修改一个step项
    //    NSMutableArray* steps =[targetBuf stepsModel];
    //    StepModel* step = steps[0];
    //    NSString* name = [step stepName];
    //    NSLog(@"step name %@",name);
    //    step.stepName = @"处理model";
    //    [step updataAll];
    //    NSString* name2 = [[targetBuf stepsModel][0]stepName];
    //    NSLog(@"step name %@",name2);
    //    NSString* _plistPath = [[NSBundle mainBundle] pathForResource:@"targetApp" ofType:@"plist"];
    //    NSMutableArray * DataMaster = [NSMutableArray arrayWithContentsOfFile:_plistPath];
    //    NSMutableArray* steps2 = DataMaster[0][@"steps"];
    //    NSString* name3 = steps2[0][@"setpName"];
    //    NSLog(@"setpName %@",name3);
    
    //    //测试3 添加一个step项
    //    StepModel* step = steps[0];
    //    [targetBuf addStep:@"写完model" stepDetails:@"好好活着" stepImagePath:@"no.png" stepBuildTime:@"20161010" stepEndTime:@"20161111" giftPath:[[NSMutableArray alloc]init]];
    //    NSMutableArray* steps =[targetBuf stepsModel];
    //
    //    //测试 4 删除一个step项
    //    StepModel* step2 = steps[2];
    //
    //    [step2 deleteMe];
    //    NSString* _plistPath = [[NSBundle mainBundle] pathForResource:@"targetApp" ofType:@"plist"];
    //    NSMutableArray * DataMaster = [NSMutableArray arrayWithContentsOfFile:_plistPath];
    //    NSMutableArray* steps2 = DataMaster[0][@"steps"];
    //    NSMutableDictionary* steps3 = steps2[2];
    //    NSString* name3 = steps3[@"setpName"];
    //    NSLog(@"setpName %@",name3);
    
    //测试 5 修改一个gift
    NSMutableArray* gifts =[targetBuf giftsModel];
    GiftModel* gift = gifts[0];
    NSLog(@"%@",gift.giftName);
    //    gift.giftName = @"好好活着";
    //    [gift updataAll];
    //    //测试 6 添加一个Gift
    //    [targetBuf addGift:@"好好活着" giftUrl:@"空" giftImage:@"sb.png" setpPath:[[NSMutableArray alloc]init]];
    //
    //    NSString* _plistPath = [[NSBundle mainBundle] pathForResource:@"targetApp" ofType:@"plist"];
    //    NSMutableArray * DataMaster = [NSMutableArray arrayWithContentsOfFile:_plistPath];
    //    NSMutableArray* gifts2 = DataMaster[0][@"gifts"];
    //    NSString* giftName = gifts2[1][@"giftName"];
    //    NSLog(@"%@",giftName);
    
}

@end

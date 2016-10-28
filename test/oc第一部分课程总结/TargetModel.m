//
//  TargetModle.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "TargetModel.h"

@implementation TargetModel

-(TargetModel*)init:(NSMutableDictionary *)data{
    self = [super init];
    if (self) {
        _giftsModel = [[NSMutableArray alloc]init];
        _stepsModel = [[NSMutableArray alloc]init];
        
        _fatherData = data;
        _headerData = data[@"headerFooter"];
        _stepData = data[@"steps"];
        _giftData = data[@"gifts"];
        NSLog(@"_headerData%@", _headerData);
        NSLog(@"_stepData%@", _stepData);
        NSLog(@"_giftData%@", _giftData);

        _headerModel = [[HeaderModel alloc]init:_headerData];
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
        [_stepsModel addObject:sigleStep];
    }
}
-(void)initGift{
     GiftModel* singleGift = nil;
    for (NSInteger i =0; i<_giftData.count; i++) {
        singleGift = [[GiftModel alloc]init:_giftData[i]];
        [_giftsModel addObject:singleGift];
    }
}

-(void)upData{
    [_fatherData setObject:_stepData forKey:@"steps"];
    [_fatherData setObject:_giftData forKey:@"gifts"];
    [_fatherData setObject:_headerModel forKey:@"headerFooter"];
}

@end

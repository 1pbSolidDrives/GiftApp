//
//  GiftDetailRootModel.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/28.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "GiftDetailRootModel.h"

@implementation GiftDetailRootModel

-(instancetype)init:(NSMutableArray *)dataPlist{
    self = [super init];
    if (self) {
        _dataPlist = dataPlist;
        for (NSInteger i =0 ; i<_dataPlist.count; i++) {
             [self initMySon:_dataPlist[i]];
        }
    }
    return self;
}

-(void)initMySon:(NSMutableDictionary*)sonDataPlist{
    GiftDetailHeaderModel* sonBuf = [[GiftDetailHeaderModel alloc]init:sonDataPlist];
    [_dataModels addObject:sonBuf];
}

@end

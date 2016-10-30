//
//  GiftDetailHeaderModel.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/28.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "GiftDetailHeaderModel.h"

@implementation GiftDetailHeaderModel

-(GiftDetailHeaderModel*)init:(NSMutableDictionary*)dataPlist{
    self = [super init];
    if (self) {
        _dataPlist = dataPlist;
        [self initMySon:_dataPlist[@"detailMessages"]];
        _headerName = _dataPlist[@"detailItemName"];
    }
    return self;
}

-(void)initMySon:(NSMutableArray*)sonDataPlist{
    GiftDetailMessage* sonBuf = nil;

    for (NSInteger i =0 ; i<sonDataPlist.count; i++) {
        sonBuf = [[GiftDetailMessage alloc]init:sonDataPlist[i]];
        [_dataModels addObject:sonDataPlist];
    }
}

@end


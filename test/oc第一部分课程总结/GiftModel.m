//
//  GiftModle.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "GiftModel.h"

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
@end

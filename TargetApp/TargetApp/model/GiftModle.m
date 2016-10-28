//
//  GiftModle.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "GiftModle.h"

@implementation GiftModle
-(GiftModle *)init:(NSMutableDictionary *)giftData{
    self = [super init];
    if (self) {
        _fatherData = giftData;
        _giftName   = giftData[@"giftName"];
        _giftImage  = giftData[@"giftImage"];
        _giftUrl    = giftData[@"giftUrl"];
        _stepPath   = giftData[@"setpPath"];
        _canBuyThisGift = NO;
    }
    
    return self;
}
-(void)updataAll{
    [_fatherData setObject:_giftName forKey:@"giftName"];
    [_fatherData setObject:_giftImage forKey:@"giftImage"];
    [_fatherData setObject:_giftUrl forKey:@"giftUrl"];
    [_fatherData setObject:_stepPath forKey:@"setpPath"];

    
}
@end

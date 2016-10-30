//
//  GiftDetailMessage.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/28.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "GiftDetailMessage.h"

@implementation GiftDetailMessage
 
-(instancetype)init:(NSMutableDictionary*)dataInPlist{
    self = [super init];
    if (self != nil) {
        _dataInPlist = dataInPlist;
        _name = _dataInPlist[@"messageName"];
        _detail = _dataInPlist[@"detail"];
        _url = _dataInPlist[@"url"];
    }
    return self;
}



@end

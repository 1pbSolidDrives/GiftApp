//
//  HaederModle.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "HeaderModel.h"

@implementation HeaderModel

-(HeaderModel*)init:(NSMutableDictionary*)headerData{
    self = [super init];
    if (self) {
        _myDataPlist = headerData;
        
        _completeness = headerData[@"completeness"];
        _targetDetails = headerData[@"targetDetails"];
        _targetHeaderName = headerData[@"targetHeaderName"];
        _targetHeaderImagePath = headerData[@"targetHeaderImagePath"];
    }
    
    return self;
}

-(void)upDataMySelf{
    @try {
        [_myDataPlist setObject:_completeness forKey:@"completeness"];
        [_myDataPlist setObject:_targetDetails forKey:@"targetDetails"];
        [_myDataPlist setObject:_targetHeaderName forKey:@"targetHeaderName"];
        [_myDataPlist setObject:_targetHeaderImagePath forKey:@"targetHeaderImagePath"];
    } @catch (NSException *exception) {
        NSLog(@"HeaderModel upDataMySelf error!!!  %@",exception);
    } @finally {
        
    }
}

-(Boolean)upDataAll{
    [self upDataMySelf];
    if (_delegate&& [_delegate conformsToProtocol:@protocol(HeaderModelProtocol)]) {
        return [_delegate headerModelProtocolUpData:self];
    }
    return NO;
}



@end

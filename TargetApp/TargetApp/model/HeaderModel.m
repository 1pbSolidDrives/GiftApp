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
        _completeness = headerData[@"completeness"];
        _targetDetails = headerData[@"targetDetails"];
        _targetHeaderName = headerData[@"targetHeaderName"];
        _targetHeaderImagePath = headerData[@"targetHeaderImagePath"];
        
    }
    
    return self;
}

-(void)updataAll{
    [_fatherData setObject:_completeness forKey:@"completeness"];
    [_fatherData setObject:_targetDetails forKey:@"targetDetails"];
    [_fatherData setObject:_targetHeaderName forKey:@"targetHeaderName"];
    [_fatherData setObject:_targetHeaderImagePath forKey:@"targetHeaderImagePath"];

}
@end

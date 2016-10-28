//
//  HaederModle.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HeaderModel : NSObject
-(HeaderModel*)init:(NSMutableDictionary*)headerData;
-(void)updataAll;


@property(nonatomic,strong)NSString* completeness;

@property(nonatomic,strong)NSString* targetDetails;
@property(nonatomic,strong)NSString* targetHeaderName;
@property(nonatomic,strong)NSString* targetHeaderImagePath;
@property(nonatomic,strong)NSString* targetBeginTime;
@property(nonatomic,strong)NSString* targetExpectTime;

@property(nonatomic,strong)NSMutableDictionary* fatherData;
@end
